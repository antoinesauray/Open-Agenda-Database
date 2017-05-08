CREATE TABLE [Entities]
(
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(40) NOT NULL,
	[Owner] INT NOT NULL,
    [Properties] NVARCHAR(MAX) NOT NULL DEFAULT '{}',
	[Active] BIT DEFAULT 1,
	[Image] VARCHAR(MAX),
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
	[DefaultAccess] TINYINT REFERENCES AccessLevels(Id),
    CHECK ( ISJSON([Properties])>0 )
);

