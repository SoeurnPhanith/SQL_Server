-----------TODO about Sub Query--------------
USE AdvanceDB;

CREATE TABLE AdvanceDB.dbo.Category(
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE AdvanceDB.dbo.Product(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT DEFAULT 0,
    CategoryId INT,
    CreatedDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (CategoryId) REFERENCES AdvanceDB.dbo.Category(CategoryId)
);

--// Insert data//--
INSERT INTO AdvanceDB.dbo.Category(Name) VALUES
('Electronics'),
('Food'),
('Drink'),
('Fashion'),
('Furniture');

INSERT INTO AdvanceDB.dbo.Product (Name, Price, Quantity, CategoryId) VALUES
('iPhone 14 Pro', 999.00, 10, 1),
('Samsung Galaxy S23', 899.00, 15, 1),
('MacBook Air M2', 1199.00, 5, 1),
('Dell XPS 13', 1099.00, 7, 1),

('Burger', 5.50, 50, 2),
('Pizza', 8.99, 40, 2),
('Fried Chicken', 6.50, 60, 2),

('Coca Cola 330ml', 0.75, 200, 3),
('Pepsi 330ml', 0.70, 180, 3),

('Nike Air Force 1', 120.00, 25, 4),
('Adidas Ultraboost', 150.00, 20, 4),

('Office Chair', 85.00, 12, 5),
('Wooden Desk', 150.00, 8, 5);

INSERT INTO AdvanceDB.dbo.Product (Name, Price, Quantity, CategoryId, CreatedDate) VALUES

-- Day 1
('HP Laptop', 850.00, 6, 1, DATEADD(DAY, -1, GETDATE())),
('Keyboard Mechanical', 45.00, 30, 1, DATEADD(DAY, -1, GETDATE())),
('Milk 1L', 2.00, 100, 3, DATEADD(DAY, -1, GETDATE())),

-- Day 2
('Monitor 27 inch', 250.00, 12, 1, DATEADD(DAY, -2, GETDATE())),
('Ice Coffee', 1.50, 150, 3, DATEADD(DAY, -2, GETDATE())),
('Hotdog', 3.00, 80, 2, DATEADD(DAY, -2, GETDATE())),

-- Day 3
('Gaming Mouse', 35.00, 40, 1, DATEADD(DAY, -3, GETDATE())),
('T-shirt Nike', 25.00, 60, 4, DATEADD(DAY, -3, GETDATE())),
('Water Bottle', 0.50, 200, 3, DATEADD(DAY, -3, GETDATE())),

-- Day 4
('Office Table', 120.00, 10, 5, DATEADD(DAY, -4, GETDATE())),
('Sandwich Egg', 2.50, 90, 2, DATEADD(DAY, -4, GETDATE())),
('Green Tea', 1.20, 110, 3, DATEADD(DAY, -4, GETDATE())),

-- Day 5
('AirPods Pro', 249.00, 18, 1, DATEADD(DAY, -5, GETDATE())),
('Jeans Levis', 60.00, 35, 4, DATEADD(DAY, -5, GETDATE())),
('Orange', 1.00, 120, 2, DATEADD(DAY, -5, GETDATE())),

-- Day 6
('Smart Watch', 199.00, 22, 1, DATEADD(DAY, -6, GETDATE())),
('Jacket Adidas', 80.00, 15, 4, DATEADD(DAY, -6, GETDATE())),
('Cake Chocolate', 10.00, 25, 2, DATEADD(DAY, -6, GETDATE())),

-- Day 7
('Tablet Samsung', 300.00, 9, 1, DATEADD(DAY, -7, GETDATE())),
('Sofa', 400.00, 5, 5, DATEADD(DAY, -7, GETDATE())),
('Apple Juice', 2.20, 130, 3, DATEADD(DAY, -7, GETDATE()));

--// SELECT All Normal//--
SELECT * FROM dbo.Category;

SELECT * FROM dbo.Product;

--- *** Use Single row Sub Query for filter *** ---
--Select all product with condition want category id who store drink
SELECT * FROM dbo.Product
WHERE CategoryId = (
    SELECT CategoryId 
    FROM dbo.Category
    WHERE Name = 'Drink'
);

--Select One product who having highest price
SELECT * FROM dbo.Product
WHERE Price = (
    SELECT MAX(Price) FROM dbo.Product
);

--Get product with minimum price
SELECT Name , Price 
FROM dbo.Product 
WHERE Price = (
    SELECT MIN(Price) FROM dbo.product
); 

--Get Product between day 2026-03-24 to 2026-03-29
SELECT *
FROM dbo.Product
WHERE CreatedDate >= '2026-03-24'
  AND CreatedDate <= (
      SELECT MAX(CreatedDate)
      FROM dbo.Product
      WHERE CreatedDate < '2026-03-30'
  );

--want to know having many product created from today to last 5 days
SELECT *
FROM dbo.product
WHERE CreatedDate >= (
    SELECT DATEADD(DAY, -5, MAX(CreatedDate))
    FROM dbo.product
);

--want product name having category Fashion
SELECT Name FROM dbo.Product
WHERE CategoryId = (
    SELECT CategoryId 
    FROM dbo.Category
    WHERE Name = 'Fashion'
);

--want all product accept category Electronics
SELECT * FROM dbo.Product
WHERE CategoryId <>(
    SELECT CategoryId
    FROM dbo.Category
    WHERE Name = 'Electronics'
);
