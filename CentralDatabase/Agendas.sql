CREATE TABLE [Agendas] 
(
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
	[Owner] INT NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedAt] DATETIME NULL,
    [EntityId] INT NOT NULL REFERENCES Entities(Id),
    [AgendaType] VARCHAR(20) NOT NULL REFERENCES AgendaTypes(Id),
    [Properties] NVARCHAR(MAX) DEFAULT '{}' NOT NULL,
    [Active] BIT DEFAULT 1 NOT NULL,
    [Image] VARCHAR(MAX),
	[DefaultAccess] TINYINT REFERENCES AccessLevels(Id),
	CHECK ( ISJSON([Properties])>0 )
);