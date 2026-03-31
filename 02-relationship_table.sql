---Relationship Table---
USE SchoolDB;

---// One Many//---
CREATE TABLE SchoolDB.dbo.Category(
    Id INT IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(50)
);

--relationship with table product bacause one category having many product in same category
CREATE TABLE SchoolDB.dbo.Product(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CategoryId INT ,
    Name VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Description VARCHAR(100) 

    --connect
    FOREIGN KEY(CategoryId) REFERENCES dbo.Category(Id)
);

-- about table category--
INSERT INTO dbo.Category(Name)
VALUES('Energy Drink'), ('Bread'), ('Fast Food');

-- about table product--
INSERT INTO dbo.Product(CategoryId,Name,Price,Description)
VALUES(1,'Krud', 0.70, 'KRUD'),(2, 'Pizza', 2.55, 'PIZZA'), 
(2, 'Burger', 1.5, 'BURGER'), (1, 'Bacus-Blue', 0.75, 'BACUS');


SELECT * FROM dbo.Category;
SELECT * FROM dbo.Product;