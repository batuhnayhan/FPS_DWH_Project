/*
This script was created to update the UpdateDate column in case of an update in the Dimension and Fact tables in DWH
*/

CREATE TRIGGER [dbo].[FACT_PlayerPerformance_UpdateDate]
ON [dbo].[FACT_PlayerPerformance]
AFTER UPDATE 
AS
   UPDATE [dbo].[FACT_PlayerPerformance]
   SET UpdateDate = GETDATE()
   FROM Inserted i
   WHERE [dbo].[FACT_PlayerPerformance].PlayerID = i.PlayerID

CREATE TRIGGER [dbo].[DIM_League_UpdateDate]
ON [dbo].[DIM_League]
AFTER UPDATE 
AS
   UPDATE [dbo].[DIM_League]
   SET UpdateDate = GETDATE()
   FROM Inserted i
   WHERE [dbo].[DIM_League].LeagueID = i.LeagueID

CREATE TRIGGER [dbo].[DIM_Nation_UpdateDate]
ON [dbo].[DIM_Nation]
AFTER UPDATE 
AS
   UPDATE [dbo].[DIM_Nation]
   SET UpdateDate = GETDATE()
   FROM Inserted i
   WHERE [dbo].[DIM_Nation].NationID = i.NationID

CREATE TRIGGER [dbo].[DIM_Position_UpdateDate]
ON [dbo].[DIM_Position]
AFTER UPDATE 
AS
   UPDATE [dbo].[DIM_Position]
   SET UpdateDate = GETDATE()
   FROM Inserted i
   WHERE [dbo].[DIM_Position].PositionID = i.PositionID

CREATE TRIGGER [dbo].[DIM_Team_UpdateDate]
ON [dbo].[DIM_Team]
AFTER UPDATE 
AS
   UPDATE [dbo].[DIM_Team]
   SET UpdateDate = GETDATE()
   FROM Inserted i
   WHERE [dbo].[DIM_Team].TeamID = i.TeamID






