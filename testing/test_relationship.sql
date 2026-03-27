CREATE DATABASE nith;

Use nith;

/*table student*/
CREATE TABLE tblStudents(
    StuId int IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL, 
    Gender VARCHAR(6) NOT NULL, 
    DoB date
);

/*table score*/
CREATE TABLE tblScore(
    ScId int IDENTITY(1,1) PRIMARY KEY,
    StuId int, 
    Score DECIMAL(10,2)

    FOREIGN KEY (StuId) REFERENCES tblStudents(StuId)
);

/*insert score*/

INSERT INTO tblScore(StuId, Score) VALUES
(2, 95),
(3, 88),
(4, 76),
(5, 89),
(6, 92);

/*insert student*/
INSERT INTO tblStudents(Name, Gender, DoB) VALUES
('Soeurn Channen', 'Male', '2010-10-05'),
('Kim Sokha', 'Female', '2006-03-10'),
('Chan Dara', 'Male', '2006-07-22'),
('Nita Ratha', 'Female', '2006-01-05'),
('Vuthy Dara', 'Male', '2006-12-30');


/*Select*/
SELECT * FROM tblStudents;
SELECT  * FROM tblScore ORDER BY Score ASC;


/*DROP table*/
DROP TABLE tblStudents;
DROP TABLE tblScore;




