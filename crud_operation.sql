--Crud Operation in Databases--
USE SchoolDB;

--// insert //--
INSERT INTO dbo.Students(Name, Gender, Subject)
VALUES ('Soeurn Phanith', 'Male', 'Java Spring boot');

INSERT INTO dbo.Students(Name, Gender, Subject)
VALUES ('Soeurn Phanith', 'Male', 'Java Spring boot');


--many insert
INSERT INTO dbo.Students(Name,Gender,Subject)
VALUES('Soeurn Channen' , 'Male','General Education'),
      ('Soeurn Chaanna', 'Female', 'General Education'),
      ('Soeurn Vireakseth', 'Male', 'General Education'), 
      ('Soeurn Chanvilla', 'Female', 'Child');


--// Show data //--
SELECT * FROM dbo.Students;

SELECT Name , Subject FROM dbo.Students;


--// Update //--
UPDATE dbo.Students
SET Name = 'Phanith' WHERE id = 6;


--// Delete //--
DELETE FROM dbo.Students 
WHERE Id = 6;