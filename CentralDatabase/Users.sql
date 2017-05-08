CREATE TABLE [dbo].[Users]
(
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
	[FacebookId] VARCHAR(50) UNIQUE,
	[FacebookToken] VARCHAR(255),
	[FirstName] NVARCHAR(30),
	[LastName] NVARCHAR(30) NULL,
	[Picture] VARCHAR(300),
	[FacebookEmail] VARCHAR(60) UNIQUE NULL, 
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UpdatedAt] DATETIME NULL,
)
