------Relationship Table----------
USE SchoolDB;

---// One to One //---
CREATE TABLE SchoolDB.dbo.Users(
    Id TINYINT IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(100), 
    Email VARCHAR(50) NOT NULL UNIQUE 
);

CREATE TABLE SchoolDB.dbo.Profiles(
    Id TINYINT IDENTITY(1,1) PRIMARY KEY,
    UserId TINYINT UNIQUE, 
    Bio VARCHAR(50),

    FOREIGN KEY (UserId) REFERENCES SchoolDB.dbo.Users(Id) ON DELETE CASCADE
    --When using ON DELETE CASECAD if delete User -> profile is auto delete too 
)


--about table profile--
INSERT INTO dbo.Profiles(UserId, Bio)
VALUES(4, 'Keep positive and study hard');

DELETE FROM dbo.Profiles WHERE Id = 4;



--abou table users--
INSERT INTO dbo.Users(Name, Email)
VALUES('Phanith Soeurn', 'phanithsoeurn@gmail.com');

INSERT INTO dbo.Users(Name,Email)
VALUES('Soeurn Channen', 'nen@gmail.com');

DELETE FROM dbo.Users WHERE Id = 1;


SELECT * FROM dbo.Users;
SELECT * FROM dbo.Profiles;