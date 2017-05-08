CREATE TRIGGER [InsertUserAgendas]
ON [dbo].[Users]
AFTER INSERT
AS
BEGIN
declare @agendaIdVal int
declare @UserId int
declare @UserEntityId int
declare @UserFirstName varchar(40)
declare @UserLastName varchar(40)
DECLARE @table table (id int)

		SET NOCOUNT ON;

		SET @UserId = (SELECT Id FROM inserted)
		SET @UserFirstName = (SELECT FirstName FROM inserted)
		SET @UserLastName = (SELECT LastName FROM inserted)

		/*
			Create the user Entity
	   */
		INSERT INTO Entities([Owner], [Name]) OUTPUT inserted.Id into @table VALUES (@UserId, @UserFirstName + ' ' + @UserLastName);
		SELECT @UserEntityId = Id FROM @table;

		/*
			Give Read-Write rights
	   */
		INSERT INTO UserEntityRights(UserId, EntityId, AccessLevel) VALUES (@UserId, @UserEntityId, 30);

       
	   /*
			Create the Facebook agenda
	   */
		INSERT INTO Agendas([Owner], [Name], [EntityId], [AgendaType]) OUTPUT inserted.Id into @table VALUES (@UserId, 'Facebook', @UserEntityId, 'facebook');
		SELECT @agendaIdVal = Id FROM @table;

		/*
			Add it to the user agendas
	   */
		INSERT INTO UserAgendas([Provider], [UserId], [AgendaId]) VALUES (1, @UserId, @agendaIdVal);
		SELECT @agendaIdVal = Id from @table;

		/*
			Give Read Only rights on it
	   */
		INSERT INTO UserAgendaRights(UserId, AgendaId, AccessLevel) VALUES (@UserId, @agendaIdVal, 10);

		 /*
			Create a Personal agenda
	   */
	    INSERT INTO Agendas([Owner], [Name], [EntityId], [AgendaType])  OUTPUT inserted.Id into @table VALUES (@UserId, @UserFirstName + ' ' + @UserLastName, @UserEntityId, 'personal');
        SELECT @agendaIdVal = Id from @table;
		/*
			Add it to the user agendas
	   */
	    INSERT INTO UserAgendas(Provider, UserId, AgendaId) OUTPUT inserted.AgendaId into @table VALUES (1, @UserId, @agendaIdVal);
		/*
			Give full rights on it (but no admin to prevent deletion)
	   */
		INSERT INTO UserAgendaRights(UserId, agendaId, AccessLevel) VALUES (@UserId, @agendaIdVal, 30);
END
