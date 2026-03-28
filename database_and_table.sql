---- Database and Table -----------
CREATE DATABASE SchoolDB;



-- Create table with database name (way1)--
CREATE TABLE SchoolDB.dbo.Students(
    Id TINYINT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL, 
    Gender VARCHAR(10) NOT NULL, 
    Subject VARCHAR(25)
);


--Create table with database name (way2)--
USE SchoolDB;

CREATE TABLE dbo.Products(
    Id TINYINT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL, 
    Price DECIMAL(10,2) NOT NULL, 
    Quantity INT
);