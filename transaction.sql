----- Using Transactions-----
CREATE DATABASE Ecommerce;
USE Ecommerce;

--//Create Table Category//--
CREATE TABLE Ecommerce.dbo.Category(
    CategoryId INT IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(50),
    CreatedDate DATETIME DEFAULT GETDATE()
);

--//Create Table Product and relate with Category//--
CREATE TABLE Ecommerce.dbo.Product(
    ProductId INT IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL, 
    Price DECIMAL(10,2), 
    CategoryId INT, 
    Quantity INT , 
    CreatedDate DATETIME DEFAULT GETDATE()

    --relationship--
    FOREIGN KEY (CategoryId) REFERENCES dbo.Category(CategoryId)
);

--//Create Table Order and relate with Product//--
CREATE TABLE Ecommerce.dbo.Orders(
    OrdersId INT IDENTITY(1,1) PRIMARY KEY, 
    OrdersDate DATETIME DEFAULT GETDATE(),
    ProductId INT,

    --relationship--
    FOREIGN KEY(ProductId) REFERENCES dbo.Product(ProductId)
);

--//Create Table Payment and relate with Orders//--
CREATE TABLE Ecommerce.dbo.Payment(
    PaymentId INT IDENTITY(1,1) PRIMARY KEY, 
    OrdersId INT, 
    Amount DECIMAL(10,2), 
    PaymentDate DATETIME DEFAULT GETDATE()

      --relationship--
    FOREIGN KEY(OrdersId) REFERENCES dbo.Orders(OrdersId)
);

-----Insert data to these table and will todo transaction-----
--//Table Category//--
INSERT INTO Category (Name)
VALUES 
('Drink'),('Food'),('Snack'),('Fruit'),
('Electronics'),('Clothes'),('Stationery');

--//Table Product//--
INSERT INTO Product (Name, Price, Quantity, CategoryId)
VALUES
('Coca Cola', 1.50, 10, 1),('Pizza', 8.00, 5, 2),('Chips', 2.50, 20, 3),
('Apple', 1.20, 15, 4),('Headphone', 25.00, 7, 5),('T-Shirt', 12.00, 9, 6),
('Notebook', 3.00, 30, 7);


--// goal of for these table about Ecommerce having 3 goal now : 
--  1. reduce product quantity when user order already
--  2. create orders product
--  3. payments 

--// flow and logic for todo with this transaction of Ecommerce : 
-- 1. check stock (quantity)
-- 2. reduce stock 
-- 3. insert orders
-- 4. insert payments
-- 5. commit or rollback 

-------- Static value nothing parameter ----------
BEGIN TRY 
    BEGIN TRANSACTION
    -- declare variable for static value 
    DECLARE @ProductId INT = 2;
    DECLARE @Qty INT = 4;
    DECLARE @Price DECIMAL(10,2);
    DECLARE @Amount DECIMAL(10,2);
    DECLARE @Stock INT;
    DECLARE @OrderId INT;

    -- check stock with product who user ordered
    SELECT 
        @Stock = Quantity,
        @Price = Price
    FROM Product
    WHERE ProductId = @ProductId;

    IF @Stock IS NULL
        THROW 50001, 'Product not found', 1; 
    IF @Stock < @Qty
        THROW 50002, 'Not Enough Stock', 1 ;

    SET @Amount = @Price * @Qty;

    -- update stock 
    UPDATE dbo.Product
    SET Quantity = Quantity - @Qty
    WHERE ProductId = @ProductId;

    -- insert orders to orders table
    INSERT INTO dbo.Orders(ProductId)
    VALUES(@ProductId);
    SET @OrderId = SCOPE_IDENTITY();

    -- insert payment to payment table 
    INSERT INTO Payment(OrdersId, Amount)
    VALUES(@OrderId, @Amount);

    --commit it for success 
    COMMIT; 
    PRINT 'Orders Completed Successful';
END TRY
BEGIN CATCH
    --having error must rollback
    ROLLBACK;

    PRINT ERROR_MESSAGE();
END CATCH;



-----------Using Dynamic Transaction with product no need to set value in variable ----------
BEGIN TRY
    BEGIN TRANSACTION;

    --DECLARE VARIABLE 
    DECLARE @ProductName VARCHAR(100) = 'Notebook'; -- user input
    DECLARE @Qty INT = 3;

    DECLARE @ProductId INT;
    DECLARE @Price DECIMAL(10,2);
    DECLARE @Stock INT;
    DECLARE @Amount DECIMAL(10,2);
    DECLARE @OrderId INT;

    --  Get product info by Name
    SELECT 
        @ProductId = ProductId,
        @Price = Price,
        @Stock = Quantity
    FROM Product
    WHERE Name = @ProductName;

    IF @ProductId IS NULL
        THROW 50001, 'Product not found', 1;
    IF @Stock < @Qty
        THROW 50002, 'Not enough stock', 1;

    SET @Amount = @Price * @Qty;

    --  Update stock
    UPDATE Product
    SET Quantity = Quantity - @Qty
    WHERE ProductId = @ProductId;

    --  Insert Order
    INSERT INTO Orders(ProductId)
    VALUES(@ProductId);

    SET @OrderId = SCOPE_IDENTITY();

    --  Insert Payment
    INSERT INTO Payment(OrdersId, Amount)
    VALUES(@OrderId, @Amount);

    -- SUCCESS
    COMMIT;

    PRINT 'Order completed successfully';
END TRY
BEGIN CATCH
    ROLLBACK;

    PRINT ERROR_MESSAGE();
END CATCH;



---View result order and paymentSELECT * FROM dbo.Product;
SELECT * FROM dbo.Orders;

SELECT * FROM dbo.Payment;

SELECT * FROM dbo.Product;