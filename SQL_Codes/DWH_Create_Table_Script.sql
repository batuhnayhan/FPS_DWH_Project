CREATE TABLE DIM_League(
	LeagueID int not null,
	LeagueName nvarchar(50) not null,
	Description nvarchar(50),
	InsertDate	datetime default getdate(),
	UpdateDate	datetime default getdate(),
	CONSTRAINT PK_LeagueID PRIMARY KEY (LeagueID));

CREATE TABLE DIM_Nation(
	NationID int not null,
	NationName nvarchar(50) not null,
	Description nvarchar(50),
	InsertDate	datetime default getdate(),
	UpdateDate	datetime default getdate(),
	CONSTRAINT PK_NationID PRIMARY KEY (NationID));

CREATE TABLE DIM_Position(
	PositionID int not null,
	PositionName nvarchar(50) not null,
	Description nvarchar(50),
	InsertDate	datetime default getdate(),
	UpdateDate	datetime default getdate(),
	CONSTRAINT PK_PositionID PRIMARY KEY (PositionID));

CREATE TABLE DIM_Team(
	TeamID int not null,
	TeamName nvarchar(50) not null,
	Description nvarchar(50),
	InsertDate	datetime default getdate(),
	UpdateDate	datetime default getdate(),
	CONSTRAINT PK_TeamID PRIMARY KEY (TeamID));

CREATE TABLE FACT_PlayerPerformance(
	PlayerID	int identity(1,1) not null,
	PlayerName	nvarchar(255),
	PlayerCode	nvarchar(50),
	Season	nvarchar(50),
	BornDateKey	int not null,
	PositionID	int not null,
	LeagueID	int not null,
	TeamID	int not null,
	NationID	int not null,
	MatchesPlayed	int,
	MatchesStarts	int,
	MatchesMinutes	float,
	Goals	int,
	Assist	int,
	PkGoals	int,
	PkAttempted	int,
	YellowCards	int,
	YellowCardsSecond	int,
	RedCards	int,
	xG	float,
	npXG	float,
	xA	float,
	ShotsTotal	int,
	ShotsOnTarget	int,
	FreeKicks	int,
	TotalPassesCompleted	int,
	TotalPassesAttempted	int,
	TotalDistance	int,
	TotalProgressiveDistance	int,
	ShortPassesCompleted	int,
	ShortPassesAttempted	int,
	MediumPassesCompleted	int,
	MediumPassesAttempted	int,
	LongPassesCompleted	int,
	LongPassesAttempted	int,
	KeyPasses	int,
	CompletedPassesAttackingArea	int,
	CompletedPassesPenaltyArea	int,
	CompletedCrossesPenaltyArea	int,
	LiveBallPasses	int,
	DeadBallPasses	int,
	FreeKicksPassesAttempted	int,
	BetweenDefendersPassesCompleted	int,
	PassesUnderPressure	int,
	Crosses	int,
	CornerKicks	int,
	LeftFootPassesAttempted	int,
	RightFootPassesAttempted	int,
	HeadPassesAttempted	int,
	Offsides	int,
	Tackle	int,
	TackleWon	int,
	DefensiveAreaTackle	int,
	MiddleAreaTackle	int,
	AttackingAreaTackle	int,
	TackleWSDribblers	int,
	TotalPress	int,
	DefensiveAreaPress	int,
	MiddleAreaPress	int,
	AttackingAreaPress	int,
	Blocks	int,
	Interceptions	int,
	Clearances	int,
	TotalTouchesBall	int,
	TotalTouchesLiveBall	int,
	DefensiveAreaTouches	int,
	MiddleAreaTouches	int,
	AttackingAreaTouches	int,
	PenaltyAreaTouches	int,
	DribblesAttempted	int,
	DribblesSuccessfully	int,
	PlayersDribbledPast	int,
	BallBetweenLeg	int,
	Carries	int,
	TotalCarriesDist	int,
	ProgressiveDist	int,
	CarriesIntoPenaltyArea	int,
	FoulsCommitted	int,
	FoulsDrawn	int,
	PenaltyKicksWon	int,
	OwnGoals	int,
	AerialDuelsWon	int,
	AerialDuelsLost	int,
	GoalAgainst	int,
	ShotsOnTargetAgainst	int,
	Saves	int,
	Wins	int,
	Draws	int,
	Losses	int,
	CleanSheets	int,
	PenaltyKicksAttempted	int,
	PenaltyKicksAllowed	int,
	PenaltyKicksSaved	int,
	PenaltyKicksMissed	int,
	PostShotXG	float,
	InsertDate	datetime default getdate(),
	UpdateDate	datetime default getdate(),
	CONSTRAINT PK_PlayerID PRIMARY KEY (PlayerID),
	CONSTRAINT FK_PositionID FOREIGN KEY (PositionID) REFERENCES [dbo].[DIM_Position](PositionID),
	CONSTRAINT FK_LeagueID FOREIGN KEY  (LeagueID) REFERENCES [dbo].[DIM_League](LeagueID),
	CONSTRAINT FK_TeamID FOREIGN KEY  (TeamID) REFERENCES [dbo].[DIM_Team](TeamID),
	CONSTRAINT FK_NationID FOREIGN KEY  (NationID) REFERENCES [dbo].[DIM_Nation](NationID),
	CONSTRAINT FK_BornDateKey FOREIGN KEY  (BornDateKey) REFERENCES [dbo].[DIM_Date](DateKey));


