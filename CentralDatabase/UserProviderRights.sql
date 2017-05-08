CREATE TABLE [UserProviderRights]
(
	[UserId] INT NOT NULL,
	[AccessLevel] TINYINT REFERENCES AccessLevels(Id),
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UpdatedAt] DATETIME NULL, 
    UNIQUE([UserId])
)
