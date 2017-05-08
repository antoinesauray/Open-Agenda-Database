CREATE TABLE [dbo].[UserAgendas]
(
	[UserId] INT NOT NULL REFERENCES Users(Id), 
    [AgendaId] INT NOT NULL, 
    [Provider] INT NOT NULL REFERENCES Providers(Id), 
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	UNIQUE(UserId, AgendaId, Provider) WITH (IGNORE_DUP_KEY = ON)
)