/*
The age of the player is current in the data for the 2021-2022 season.This script first updates the BornDateKey
field for players with a Date of Birth only in the 2021-2022 season after converting them to 19750101 other than that season
*/

UPDATE [FPS_ODS].[dbo].[FACT_PlayerPerformance]
SET BornDateKey = 19750101
WHERE Season != '2021-2022'

GO

WITH cte AS (
    SELECT *, MAX(BornDateKey) OVER (PARTITION BY PlayerCode) AS MaxBornDateKey
    FROM [FPS_ODS].[dbo].[FACT_PlayerPerformance]
)

UPDATE cte
SET BornDateKey = MaxBornDateKey
WHERE BornDateKey = 19750101;