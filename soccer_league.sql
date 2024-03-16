CREATE TABLE Teams (
  TeamID INT PRIMARY KEY,
  TeamName VARCHAR(255) UNIQUE,
  Location VARCHAR(255),
  CoachName VARCHAR(255)
);

CREATE TABLE Players (
  PlayerID INT PRIMARY KEY,
  FirstName VARCHAR(255) UNIQUE,
  LastName VARCHAR(255) UNIQUE,
  TeamID INT,
  Position VARCHAR(50),
  Number INT
);

CREATE TABLE Referees (
  RefereeID INT PRIMARY KEY,
  FirstName VARCHAR(255) UNIQUE,
  LastName VARCHAR(255) UNIQUE,
  ExperienceLevel INT
);

CREATE TABLE Seasons (
  SeasonID INT PRIMARY KEY,
  StartDate DATE UNIQUE,
  EndDate DATE UNIQUE,
  SeasonName VARCHAR(255)
);

CREATE TABLE Matches (
  MatchID INT PRIMARY KEY,
  SeasonID INT,
  HomeTeamID INT,
  AwayTeamID INT,
  HeadReferee INT,
  MatchDate DATE UNIQUE,
  MatchTime TIME,
  Stadium VARCHAR(255)
);

CREATE TABLE MatchDetails (
  MatchDetailID INT PRIMARY KEY,
  MatchID INT,
  PlayerID INT
);

CREATE TABLE LineUps (
  LineUpsID INT PRIMARY KEY,
  PlayerID INT,
  MatchID INT,
  TeamID INT
);

CREATE TABLE Standings (
  StandingID INT PRIMARY KEY,
  SeasonID INT,
  TeamID INT,
  Points INT,
  GoalsFor INT,
  GoalsAgainst INT,
  Wins INT,
  Losses INT,
  Draws INT
);

ALTER TABLE Standings ADD FOREIGN KEY ("StandingID") REFERENCES Teams ("TeamID");

ALTER TABLE Matches ADD FOREIGN KEY ("AwayTeamID") REFERENCES Teams ("TeamID");

ALTER TABLE Matches ADD FOREIGN KEY ("HomeTeamID") REFERENCES Teams ("TeamID");

ALTER TABLE Matches ADD FOREIGN KEY ("SeasonID") REFERENCES Seasons ("SeasonID");

ALTER TABLE Matches ADD FOREIGN KEY ("HeadReferee") REFERENCES Referees ("RefereeID");

ALTER TABLE MatchDetails ADD FOREIGN KEY ("PlayerID") REFERENCES Players ("PlayerID");

ALTER TABLE LineUps ADD FOREIGN KEY ("PlayerID") REFERENCES Players ("PlayerID");

ALTER TABLE Players ADD FOREIGN KEY ("TeamID") REFERENCES Teams ("TeamID");

ALTER TABLE LineUps ADD FOREIGN KEY ("TeamID") REFERENCES Teams ("TeamID");

ALTER TABLE MatchDetails ADD FOREIGN KEY ("MatchID") REFERENCES Matches ("MatchID");