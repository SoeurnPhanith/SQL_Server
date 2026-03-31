---Relationship table---
USE SchoolDB;

---//Many to Many//---
--So many Student can learn many course but we will create a brigde table for todo that
CREATE TABLE SchoolDB.dbo.Student(
    StudentId INT IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(100), 
    Gender VARCHAR(10), 
    Address VARCHAR(100)
);

CREATE TABLE SchoolDB.dbo.Course(
    CourseId INT IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(100), 
    Price DECIMAL(10,2), 
    StartingDate Date
);

--Bridge Table of these data (conjuction table)
CREATE TABLE SchoolDB.dbo.StudentCourse(
    Id INT IDENTITY(1,1) PRIMARY KEY, 
    CourseId INT, 
    StudentId INT, 

    --connect thse two table to here
    --PRIMARY KEY(CourseId, StudentId),
    FOREIGN KEY(CourseId) REFERENCES dbo.Course(CourseId), 
    FOREIGN KEY(StudentId) REFERENCES dbo.Student(StudentId)
);

--about table student
INSERT INTO dbo.Student(Name, Gender, Address) VALUES
('Phanith', 'Male', 'Phnom Penh'),
('Dara', 'Male', 'Siem Reap'),
('Sokha', 'Female', 'Battambang');

--about table course
INSERT INTO dbo.Course(Name, Price, StartingDate) VALUES
('C# Programming', 100, '2026-04-01'),
('Flutter Development', 120, '2026-04-05'),
('SQL Server', 90, '2026-04-10');

--about table StudentCourse
INSERT INTO dbo.StudentCourse(CourseId, StudentId) VALUES
(1, 1), -- Phanith -> C#
(2, 1), -- Phanith -> Flutter
(3, 1), -- Phanith -> SQL

(2, 2), -- Dara -> Flutter
(3, 2), -- Dara -> SQL

(1, 3); -- Sokha -> C#


SELECT * FROM dbo.Course;
SELECT * FROM dbo.Student;
SELECT * FROM dbo.StudentCourse;