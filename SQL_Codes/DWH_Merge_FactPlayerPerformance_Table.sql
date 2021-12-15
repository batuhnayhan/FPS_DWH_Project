/*
This script compares the Fact table in ODS and DWH with Merge and discards the records with update, insert and delete.
*/

MERGE INTO [FPS_DWH].[dbo].[FACT_PlayerPerformance] AS T
USING [FPS_ODS].[dbo].[FACT_PlayerPerformance] AS S
ON T.PlayerID = S.PlayerID
WHEN MATCHED AND 
(
      T.PlayerName != S.PlayerName or
      T.PlayerCode != S.PlayerCode or
      T.Season != S.Season or
      T.BornDateKey != S.BornDateKey or
      T.PositionID != S.PositionID or
      T.LeagueID != S.LeagueID or
      T.TeamID != S.TeamID or
      T.NationID != S.NationID or
      T.MatchesPlayed != S.MatchesPlayed or
      T.MatchesStarts != S.MatchesStarts or
      T.MatchesMinutes != S.MatchesMinutes or
      T.Goals != S.Goals or
      T.Assist != S.Assist or
      T.PkGoals != S.PkGoals or
      T.PkAttempted != S.PkAttempted or
      T.YellowCards != S.YellowCards or
      T.YellowCardsSecond != S.YellowCardsSecond or
      T.RedCards != S.RedCards or
      T.xG != S.xG or
      T.npXG != S.npXG or
      T.xA != S.xA or
      T.ShotsTotal != S.ShotsTotal or
      T.ShotsOnTarget != S.ShotsOnTarget or
      T.FreeKicks != S.FreeKicks or
      T.TotalPassesCompleted != S.TotalPassesCompleted or
      T.TotalPassesAttempted != S.TotalPassesAttempted or
      T.TotalDistance != S.TotalDistance or
      T.TotalProgressiveDistance != S.TotalProgressiveDistance or
      T.ShortPassesCompleted != S.ShortPassesCompleted or
      T.ShortPassesAttempted != S.ShortPassesAttempted or
      T.MediumPassesCompleted != S.MediumPassesCompleted or
      T.MediumPassesAttempted != S.MediumPassesAttempted or
      T.LongPassesCompleted != S.LongPassesCompleted or
      T.LongPassesAttempted != S.LongPassesAttempted or
      T.KeyPasses != S.KeyPasses or
      T.CompletedPassesAttackingArea != S.CompletedPassesAttackingArea or
      T.CompletedPassesPenaltyArea != S.CompletedPassesPenaltyArea or
      T.CompletedCrossesPenaltyArea != S.CompletedCrossesPenaltyArea or
      T.LiveBallPasses != S.LiveBallPasses or
      T.DeadBallPasses != S.DeadBallPasses or
      T.FreeKicksPassesAttempted != S.FreeKicksPassesAttempted or
      T.BetweenDefendersPassesCompleted != S.BetweenDefendersPassesCompleted or
      T.PassesUnderPressure != S.PassesUnderPressure or
      T.Crosses != S.Crosses or
      T.CornerKicks != S.CornerKicks or
      T.LeftFootPassesAttempted != S.LeftFootPassesAttempted or
      T.RightFootPassesAttempted != S.RightFootPassesAttempted or
      T.HeadPassesAttempted != S.HeadPassesAttempted or
      T.Offsides != S.Offsides or
      T.Tackle != S.Tackle or
      T.TackleWon != S.TackleWon or
      T.DefensiveAreaTackle != S.DefensiveAreaTackle or
      T.MiddleAreaTackle != S.MiddleAreaTackle or
      T.AttackingAreaTackle != S.AttackingAreaTackle or
      T.TackleWSDribblers != S.TackleWSDribblers or
      T.TotalPress != S.TotalPress or
      T.DefensiveAreaPress != S.DefensiveAreaPress or
      T.MiddleAreaPress != S.MiddleAreaPress or
      T.AttackingAreaPress != S.AttackingAreaPress or
      T.Blocks != S.Blocks or
      T.Interceptions != S.Interceptions or
      T.Clearances != S.Clearances or
      T.TotalTouchesBall != S.TotalTouchesBall or
      T.TotalTouchesLiveBall != S.TotalTouchesLiveBall or
      T.DefensiveAreaTouches != S.DefensiveAreaTouches or
      T.MiddleAreaTouches != S.MiddleAreaTouches or
      T.AttackingAreaTouches != S.AttackingAreaTouches or
      T.PenaltyAreaTouches != S.PenaltyAreaTouches or
      T.DribblesAttempted != S.DribblesAttempted or
      T.DribblesSuccessfully != S.DribblesSuccessfully or
      T.PlayersDribbledPast != S.PlayersDribbledPast or
      T.BallBetweenLeg != S.BallBetweenLeg or
      T.Carries != S.Carries or
      T.TotalCarriesDist != S.TotalCarriesDist or
      T.ProgressiveDist != S.ProgressiveDist or
      T.CarriesIntoPenaltyArea != S.CarriesIntoPenaltyArea or
      T.FoulsCommitted != S.FoulsCommitted or
      T.FoulsDrawn != S.FoulsDrawn or
      T.PenaltyKicksWon != S.PenaltyKicksWon or
      T.OwnGoals != S.OwnGoals or
      T.AerialDuelsWon != S.AerialDuelsWon or
      T.AerialDuelsLost != S.AerialDuelsLost or
      T.GoalAgainst != S.GoalAgainst or
      T.ShotsOnTargetAgainst != S.ShotsOnTargetAgainst or
      T.Saves != S.Saves or
      T.Wins != S.Wins or
      T.Draws != S.Draws or
      T.Losses != S.Losses or
      T.CleanSheets != S.CleanSheets or
      T.PenaltyKicksAttempted != S.PenaltyKicksAttempted or
      T.PenaltyKicksAllowed != S.PenaltyKicksAllowed or
      T.PenaltyKicksSaved != S.PenaltyKicksSaved or
      T.PenaltyKicksMissed != S.PenaltyKicksMissed or
      T.PostShotXG != S.PostShotXG
)
THEN UPDATE SET
	  T.PlayerName = S.PlayerName,
      T.PlayerCode = S.PlayerCode,
      T.Season = S.Season,
      T.BornDateKey = S.BornDateKey,
      T.PositionID = S.PositionID,
      T.LeagueID = S.LeagueID,
      T.TeamID = S.TeamID,
      T.NationID = S.NationID,
      T.MatchesPlayed = S.MatchesPlayed,
      T.MatchesStarts = S.MatchesStarts,
      T.MatchesMinutes = S.MatchesMinutes,
      T.Goals = S.Goals,
      T.Assist = S.Assist,
      T.PkGoals = S.PkGoals,
      T.PkAttempted = S.PkAttempted,
      T.YellowCards = S.YellowCards,
      T.YellowCardsSecond = S.YellowCardsSecond,
      T.RedCards = S.RedCards,
      T.xG = S.xG,
      T.npXG = S.npXG,
      T.xA = S.xA,
      T.ShotsTotal = S.ShotsTotal,
      T.ShotsOnTarget = S.ShotsOnTarget,
      T.FreeKicks = S.FreeKicks,
      T.TotalPassesCompleted = S.TotalPassesCompleted,
      T.TotalPassesAttempted = S.TotalPassesAttempted,
      T.TotalDistance = S.TotalDistance,
      T.TotalProgressiveDistance = S.TotalProgressiveDistance,
      T.ShortPassesCompleted = S.ShortPassesCompleted,
      T.ShortPassesAttempted = S.ShortPassesAttempted,
      T.MediumPassesCompleted = S.MediumPassesCompleted,
      T.MediumPassesAttempted = S.MediumPassesAttempted,
      T.LongPassesCompleted = S.LongPassesCompleted,
      T.LongPassesAttempted = S.LongPassesAttempted,
      T.KeyPasses = S.KeyPasses,
      T.CompletedPassesAttackingArea = S.CompletedPassesAttackingArea,
      T.CompletedPassesPenaltyArea = S.CompletedPassesPenaltyArea,
      T.CompletedCrossesPenaltyArea = S.CompletedCrossesPenaltyArea,
      T.LiveBallPasses = S.LiveBallPasses,
      T.DeadBallPasses = S.DeadBallPasses,
      T.FreeKicksPassesAttempted = S.FreeKicksPassesAttempted,
      T.BetweenDefendersPassesCompleted = S.BetweenDefendersPassesCompleted,
      T.PassesUnderPressure = S.PassesUnderPressure,
      T.Crosses = S.Crosses,
      T.CornerKicks = S.CornerKicks,
      T.LeftFootPassesAttempted = S.LeftFootPassesAttempted,
      T.RightFootPassesAttempted = S.RightFootPassesAttempted,
      T.HeadPassesAttempted = S.HeadPassesAttempted,
      T.Offsides = S.Offsides,
      T.Tackle = S.Tackle,
      T.TackleWon = S.TackleWon,
      T.DefensiveAreaTackle = S.DefensiveAreaTackle,
      T.MiddleAreaTackle = S.MiddleAreaTackle,
      T.AttackingAreaTackle = S.AttackingAreaTackle,
      T.TackleWSDribblers = S.TackleWSDribblers,
      T.TotalPress = S.TotalPress,
      T.DefensiveAreaPress = S.DefensiveAreaPress,
      T.MiddleAreaPress = S.MiddleAreaPress,
      T.AttackingAreaPress = S.AttackingAreaPress,
      T.Blocks = S.Blocks,
      T.Interceptions = S.Interceptions,
      T.Clearances = S.Clearances,
      T.TotalTouchesBall = S.TotalTouchesBall,
      T.TotalTouchesLiveBall = S.TotalTouchesLiveBall,
      T.DefensiveAreaTouches = S.DefensiveAreaTouches,
      T.MiddleAreaTouches = S.MiddleAreaTouches,
      T.AttackingAreaTouches = S.AttackingAreaTouches,
      T.PenaltyAreaTouches = S.PenaltyAreaTouches,
      T.DribblesAttempted = S.DribblesAttempted,
      T.DribblesSuccessfully = S.DribblesSuccessfully,
      T.PlayersDribbledPast = S.PlayersDribbledPast,
      T.BallBetweenLeg = S.BallBetweenLeg,
      T.Carries = S.Carries,
      T.TotalCarriesDist = S.TotalCarriesDist,
      T.ProgressiveDist = S.ProgressiveDist,
      T.CarriesIntoPenaltyArea = S.CarriesIntoPenaltyArea,
      T.FoulsCommitted = S.FoulsCommitted,
      T.FoulsDrawn = S.FoulsDrawn,
      T.PenaltyKicksWon = S.PenaltyKicksWon,
      T.OwnGoals = S.OwnGoals,
      T.AerialDuelsWon = S.AerialDuelsWon,
      T.AerialDuelsLost = S.AerialDuelsLost,
      T.GoalAgainst = S.GoalAgainst,
      T.ShotsOnTargetAgainst = S.ShotsOnTargetAgainst,
      T.Saves = S.Saves,
      T.Wins = S.Wins,
      T.Draws = S.Draws,
      T.Losses = S.Losses,
      T.CleanSheets = S.CleanSheets,
      T.PenaltyKicksAttempted = S.PenaltyKicksAttempted,
      T.PenaltyKicksAllowed = S.PenaltyKicksAllowed,
      T.PenaltyKicksSaved = S.PenaltyKicksSaved,
      T.PenaltyKicksMissed = S.PenaltyKicksMissed,
      T.PostShotXG = S.PostShotXG  
WHEN NOT MATCHED BY TARGET THEN
	INSERT (
	PlayerName,
	PlayerCode,
	Season,
	BornDateKey,
	PositionID,
	LeagueID,
	TeamID,
	NationID,
	MatchesPlayed,
	MatchesStarts,
	MatchesMinutes,
	Goals,
	Assist,
	PkGoals,
	PkAttempted,
	YellowCards,
	YellowCardsSecond,
	RedCards,
	xG,
	npXG,
	xA,
	ShotsTotal,
	ShotsOnTarget,
	FreeKicks,
	TotalPassesCompleted,
	TotalPassesAttempted,
	TotalDistance,
	TotalProgressiveDistance,
	ShortPassesCompleted,
	ShortPassesAttempted,
	MediumPassesCompleted,
	MediumPassesAttempted,
	LongPassesCompleted,
	LongPassesAttempted,
	KeyPasses,
	CompletedPassesAttackingArea,
	CompletedPassesPenaltyArea,
	CompletedCrossesPenaltyArea,
	LiveBallPasses,
	DeadBallPasses,
	FreeKicksPassesAttempted,
	BetweenDefendersPassesCompleted,
	PassesUnderPressure,
	Crosses,
	CornerKicks,
	LeftFootPassesAttempted,
	RightFootPassesAttempted,
	HeadPassesAttempted,
	Offsides,
	Tackle,
	TackleWon,
	DefensiveAreaTackle,
	MiddleAreaTackle,
	AttackingAreaTackle,
	TackleWSDribblers,
	TotalPress,
	DefensiveAreaPress,
	MiddleAreaPress,
	AttackingAreaPress,
	Blocks,
	Interceptions,
	Clearances,
	TotalTouchesBall,
	TotalTouchesLiveBall,
	DefensiveAreaTouches,
	MiddleAreaTouches,
	AttackingAreaTouches,
	PenaltyAreaTouches,
	DribblesAttempted,
	DribblesSuccessfully,
	PlayersDribbledPast,
	BallBetweenLeg,
	Carries,
	TotalCarriesDist,
	ProgressiveDist,
	CarriesIntoPenaltyArea,
	FoulsCommitted,
	FoulsDrawn,
	PenaltyKicksWon,
	OwnGoals,
	AerialDuelsWon,
	AerialDuelsLost,
	GoalAgainst,
	ShotsOnTargetAgainst,
	Saves,
	Wins,
	Draws,
	Losses,
	CleanSheets,
	PenaltyKicksAttempted,
	PenaltyKicksAllowed,
	PenaltyKicksSaved,
	PenaltyKicksMissed,
	PostShotXG,
	InsertDate,
	UpdateDate
	)
	VALUES 
	(
	S.PlayerName,
	S.PlayerCode,
	S.Season,
	S.BornDateKey,
	S.PositionID,
	S.LeagueID,
	S.TeamID,
	S.NationID,
	S.MatchesPlayed,
	S.MatchesStarts,
	S.MatchesMinutes,
	S.Goals,
	S.Assist,
	S.PkGoals,
	S.PkAttempted,
	S.YellowCards,
	S.YellowCardsSecond,
	S.RedCards,
	S.xG,
	S.npXG,
	S.xA,
	S.ShotsTotal,
	S.ShotsOnTarget,
	S.FreeKicks,
	S.TotalPassesCompleted,
	S.TotalPassesAttempted,
	S.TotalDistance,
	S.TotalProgressiveDistance,
	S.ShortPassesCompleted,
	S.ShortPassesAttempted,
	S.MediumPassesCompleted,
	S.MediumPassesAttempted,
	S.LongPassesCompleted,
	S.LongPassesAttempted,
	S.KeyPasses,
	S.CompletedPassesAttackingArea,
	S.CompletedPassesPenaltyArea,
	S.CompletedCrossesPenaltyArea,
	S.LiveBallPasses,
	S.DeadBallPasses,
	S.FreeKicksPassesAttempted,
	S.BetweenDefendersPassesCompleted,
	S.PassesUnderPressure,
	S.Crosses,
	S.CornerKicks,
	S.LeftFootPassesAttempted,
	S.RightFootPassesAttempted,
	S.HeadPassesAttempted,
	S.Offsides,
	S.Tackle,
	S.TackleWon,
	S.DefensiveAreaTackle,
	S.MiddleAreaTackle,
	S.AttackingAreaTackle,
	S.TackleWSDribblers,
	S.TotalPress,
	S.DefensiveAreaPress,
	S.MiddleAreaPress,
	S.AttackingAreaPress,
	S.Blocks,
	S.Interceptions,
	S.Clearances,
	S.TotalTouchesBall,
	S.TotalTouchesLiveBall,
	S.DefensiveAreaTouches,
	S.MiddleAreaTouches,
	S.AttackingAreaTouches,
	S.PenaltyAreaTouches,
	S.DribblesAttempted,
	S.DribblesSuccessfully,
	S.PlayersDribbledPast,
	S.BallBetweenLeg,
	S.Carries,
	S.TotalCarriesDist,
	S.ProgressiveDist,
	S.CarriesIntoPenaltyArea,
	S.FoulsCommitted,
	S.FoulsDrawn,
	S.PenaltyKicksWon,
	S.OwnGoals,
	S.AerialDuelsWon,
	S.AerialDuelsLost,
	S.GoalAgainst,
	S.ShotsOnTargetAgainst,
	S.Saves,
	S.Wins,
	S.Draws,
	S.Losses,
	S.CleanSheets,
	S.PenaltyKicksAttempted,
	S.PenaltyKicksAllowed,
	S.PenaltyKicksSaved,
	S.PenaltyKicksMissed,
	S.PostShotXG,
	S.InsertDate,
	S.UpdateDate
	)
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;














