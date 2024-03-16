CREATE TABLE "Doctors" (
  DoctorID INT PRIMARY KEY,
  FirstName VARCHAR(100),
  LastName VARCHAR(100),
  Specialization VARCHAR(100),
  ContactInfo VARCHAR(255)
);

CREATE TABLE "Patients" (
  PatientID INT PRIMARY KEY,
  FirstName VARCHAR(100),
  LastName VARCHAR(100),
  DOB DATE,
  Gender CHAR(1),
  ContactInfo VARCHAR(255)
);

CREATE TABLE "Visits" (
  VisitID INT PRIMARY KEY,
  PatientID INT,
  DoctorID INT,
  VisitDate DATE,
  ReasonForVisit TEXT
);

CREATE TABLE "Diseases" (
  DiseaseID INT PRIMARY KEY,
  DiseaseName VARCHAR(255),
  Description TEXT
);

CREATE TABLE "Diagnoses" (
  DiagnosisID INT PRIMARY KEY,
  VisitID INT,
  DiseaseID INT,
  Severity VARCHAR(100),
  Notes TEXT
);

ALTER TABLE Visits ADD FOREIGN KEY ("DoctorID") REFERENCES Doctors ("DoctorID");

ALTER TABLE Visits ADD FOREIGN KEY ("PatientID") REFERENCES Patients ("PatientID");

ALTER TABLE Diagnoses ADD FOREIGN KEY ("VisitID") REFERENCES Visits ("VisitDate");

ALTER TABLE Diagnoses ADD FOREIGN KEY ("DiseaseID") REFERENCES Diseases ("DiseaseID");

