
 CREATE DATABASE [Academy]

 USE Academy

-- Curators table
CREATE TABLE Curators (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(MAX) NOT NULL CHECK (Name <> ''),
    Surname NVARCHAR(MAX) NOT NULL CHECK (Surname <> '')
);

-- Faculties table
CREATE TABLE Faculties (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
);

-- Departments table
CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Building INT CHECK (Building BETWEEN 1 AND 5) NOT NULL,
    Financing MONEY DEFAULT 0 NOT NULL CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> ''),
    FacultyId INT NOT NULL
);

-- Groups table
CREATE TABLE Groups (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(10) NOT NULL UNIQUE CHECK (Name <> ''),
    Year INT CHECK (Year BETWEEN 1 AND 5) NOT NULL,
    DepartmentId INT NOT NULL
);

-- GroupsCurators table
CREATE TABLE GroupsCurators (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL
);

-- Lectures table
CREATE TABLE Lectures (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DateOfLecture DATE NOT NULL CHECK (DateOfLecture <= GETDATE()),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL
);

-- Students table
CREATE TABLE Students (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(MAX) NOT NULL CHECK (Name <> ''),
    Rating INT CHECK (Rating BETWEEN 0 AND 5) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL CHECK (Surname <> '')
);

-- Subjects table
CREATE TABLE Subjects (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
);

-- Teachers table
CREATE TABLE Teachers (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IsProfessor BIT DEFAULT 0 NOT NULL,
    Name NVARCHAR(MAX) NOT NULL CHECK (Name <> ''),
    Salary MONEY CHECK (Salary > 0) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL CHECK (Surname <> '')
);

CREATE TABLE GroupsStudents (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    GroupId INT NOT NULL,
    StudentId INT NOT NULL
);


-- GroupsLectures table
CREATE TABLE GroupsLectures (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL
);


ALTER TABLE GroupsLectures ADD FOREIGN KEY (GroupId) REFERENCES Groups(Id);
ALTER TABLE GroupsLectures  ADD FOREIGN KEY (LectureId) REFERENCES Lectures(Id);

ALTER TABLE GroupsStudents ADD FOREIGN KEY (GroupId) REFERENCES Groups(Id);

ALTER TABLE GroupsStudents ADD FOREIGN KEY (StudentId) REFERENCES Students(Id);


ALTER TABLE Departments ADD FOREIGN KEY (FacultyId) REFERENCES Faculties(Id);

ALTER TABLE Groups ADD FOREIGN KEY (DepartmentId) REFERENCES Departments(Id);

ALTER TABLE GroupsCurators ADD FOREIGN KEY (CuratorId) REFERENCES Curators(Id);
ALTER TABLE GroupsCurators ADD FOREIGN KEY (GroupId) REFERENCES Groups(Id);

ALTER TABLE Lectures ADD FOREIGN KEY (SubjectId) REFERENCES Subjects(Id);
ALTER TABLE Lectures ADD FOREIGN KEY (TeacherId) REFERENCES Teachers(Id);
