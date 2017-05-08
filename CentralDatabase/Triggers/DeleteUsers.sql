CREATE TRIGGER [DeleteUsers]
ON Users
FOR DELETE
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM UserEventRights WHERE UserId IN (SELECT deleted.Id FROM deleted);
	DELETE FROM UserAgendaRights WHERE UserId IN (SELECT deleted.Id FROM deleted);
	DELETE FROM UserEntityRights WHERE UserId IN (SELECT deleted.Id FROM deleted);
	DELETE FROM UserAgendas WHERE UserId IN (SELECT deleted.Id FROM deleted);
END