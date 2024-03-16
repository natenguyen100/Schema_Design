CREATE TABLE Regions (
  RegionID INT PRIMARY KEY,
  RegionName VARCHAR(100)
);

CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(100),
  PreferredRegionID INT
);

CREATE TABLE Posts (
  PostID INT PRIMARY KEY,
  Title VARCHAR(255),
  Text TEXT,
  UserID INT,
  Location VARCHAR(255),
  RegionID INT,
  CategoryID INT
);

CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(100)
);

ALTER TABLE Posts ADD FOREIGN KEY ("RegionID") REFERENCES Regions ("RegionID");

ALTER TABLE Posts ADD FOREIGN KEY ("UserID") REFERENCES Users ("Username");

ALTER TABLE Posts ADD FOREIGN KEY ("CategoryID") REFERENCES Categories ("CategoryID");
