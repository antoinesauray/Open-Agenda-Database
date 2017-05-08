/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

ALTER TABLE [AgendaEvents]  
 ADD [FacebookId] AS JSON_VALUE([Properties], '$.facebook_id')
CREATE UNIQUE INDEX event_unique_facebookid ON [AgendaEvents]([FacebookId]); 

INSERT INTO AccessLevels(Id, Label) VALUES(0, 'forbidden');
INSERT INTO AccessLevels(Id, Label) VALUES(10, 'read_only');
INSERT INTO AccessLevels(Id, Label) VALUES(20, 'read_write');
INSERT INTO AccessLevels(Id, Label) VALUES(30, 'full');
INSERT INTO AccessLevels(Id, Label) VALUES(40, 'admin');

ALTER TABLE UserEventRights ADD CONSTRAINT DF_UserEventRight DEFAULT '$(DefaultEventRight)' FOR AccessLevel;
ALTER TABLE UserAgendaRights ADD CONSTRAINT DF_UserAgendaRight DEFAULT '$(DefaultAgendaRight)' FOR AccessLevel;
ALTER TABLE UserEntityRights ADD CONSTRAINT DF_UserEntityRight DEFAULT '$(DefaultEntityRight)' FOR AccessLevel;
ALTER TABLE UserProviderRights ADD CONSTRAINT DF_UserProviderRight DEFAULT '$(DefaultProviderRight)' FOR AccessLevel;

ALTER TABLE Entities ADD CONSTRAINT DF_EntityRight DEFAULT '$(DefaultEntityRight)' FOR DefaultAccess;
ALTER TABLE Agendas ADD CONSTRAINT DF_AgendaRight DEFAULT '$(DefaultAgendaRight)' FOR DefaultAccess;

INSERT INTO [AgendaTypes](Id,NameFr,ColorLight,ColorDark)VALUES('university','Université','#4CAF50','#388E3C');
INSERT INTO [AgendaTypes](Id,NameFr,ColorLight,ColorDark)VALUES('edt','Général','#009688','#00796B');
INSERT INTO [AgendaTypes](Id,NameFr,ColorLight,ColorDark)VALUES('night','Nuit','#673AB7','#512DA8');
INSERT INTO [AgendaTypes](Id,NameFr,ColorLight,ColorDark)VALUES('personal','Personnel','#673AB7','#512DA8');
INSERT INTO [AgendaTypes](Id,NameFr,ColorLight,ColorDark)VALUES('facebook','Facebook','#673AB7','#512DA8');

INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('cm','Cours Magistral','#4CAF50','#388E3C');
INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('td','Travaux Dirigés','#FFC107','#FFA000');
INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('tp','Travaux pratiques','#3F51B5','#303F9F');
INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('exam','Examen', '#F44336','#D32F2F');
INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('personal','Personnel','#9C27B0','#7B1FA2');
INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('party','Soirée','#FF5722','#E64A19');
INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('meetup','Meetup','#795548','#5D4037');
INSERT INTO [EventTypes](Id,NameFr,ColorLight,ColorDark)VALUES('other','Autre','#795548','#5D4037');

INSERT INTO [RSVPStatus](Label) VALUES('attending');
INSERT INTO [RSVPStatus](Label) VALUES('maybe');
INSERT INTO [RSVPStatus](Label) VALUES('not_replied');
INSERT INTO [RSVPStatus](Label) VALUES('declined');


CREATE LOGIN ProviderLogin WITH PASSWORD = '$(LoginPassword)';
CREATE USER ProviderUser FROM LOGIN ProviderLogin;
ALTER ROLE db_datareader ADD MEMBER ProviderUser;
ALTER ROLE db_datawriter ADD MEMBER ProviderUser;