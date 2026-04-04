---Using Type 1 of function is Scalar function---
USE advanceDB;

CREATE FUNCTION dbo.CalculateDiscount
(
    @Price DECIMAL(10,2), 
    @DiscountRate DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
     RETURN @Price * (1 - @DiscountRate/100);
END;


CREATE FUNCTION dbo.AddSixDollar
(
    @Price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Price + 10;
END;


CREATE FUNCTION dbo.IsLowStock
(
    @Quantity INT
)
RETURNS INT
AS 
BEGIN
    IF @Quantity < 10
        RETURN 1; 
    RETURN 0;
END;
GO

--Testing using function in Same file--
SELECT * FROM dbo.Product
WHERE dbo.CalculateDiscount(Price,15) > 200;

SELECT * FROM dbo.Product
WHERE dbo.AddSixDollar(Price) > 15 AND CategoryId = (
    SELECT CategoryId
    FROM dbo.Category
    WHERE Name='Food'
);

SELECT Name, Quantity, dbo.IsLowStock(Quantity) AS LowStockStatus
FROM dbo.Product;