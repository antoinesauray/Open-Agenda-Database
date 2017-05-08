CREATE TABLE [UserEntityRights]
(
	[UserId] INT NOT NULL,
	[EntityId] INT NOT NULL,
	[AccessLevel] TINYINT REFERENCES AccessLevels(Id),
	[CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UpdatedAt] DATETIME NULL, 
    UNIQUE([UserID], [EntityId])
)
