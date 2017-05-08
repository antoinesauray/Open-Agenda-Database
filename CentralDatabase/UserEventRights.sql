
CREATE TABLE [UserEventRights]
(
	[UserId] INT NOT NULL,
	[EventId] INT NOT NULL,
	[AgendaId] INT NOT NULL,
	[AccessLevel] TINYINT REFERENCES AccessLevels(Id),
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UpdatedAt] DATETIME NULL, 
    UNIQUE([UserId], [EventId], [AgendaId])
)
