CREATE TABLE [AgendaEvents] 
(
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [StartTime] DATETIME NOT NULL,
    [EndTime] DATETIME NOT NULL,
    [Name] NVARCHAR(50),
    [Properties] NVARCHAR(MAX) DEFAULT '{}',
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedAt] DATETIME NULL,
    [AgendaId] INT REFERENCES Agendas(Id),
    [EventType] VARCHAR(20) REFERENCES EventTypes([Id]),
	CHECK ( ISJSON([Properties])>0 )
);
