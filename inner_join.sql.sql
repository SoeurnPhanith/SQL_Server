---JOIN in database---
USE SchoolDB;

--Using inner join with table Course, Student, StudentCourse...
SELECT sc.Id,
       s.Name AS StudentName,
       s.Gender,
       c.Name AS CourseName,
       c.Price, 
       c.StartingDate
FROM dbo.StudentCourse sc 
INNER JOIN dbo.Student s ON sc.Id = s.StudentId
INNER JOIN dbo.Course c ON sc.Id  = c.CourseId  

SELECT sc.Id, 
       c.Name AS CourseName, 
       c.Price, 
       c.StartingDate
FROM dbo.StudentCourse sc
INNER JOIN dbo.Course c ON sc.Id = c.CourseId;
