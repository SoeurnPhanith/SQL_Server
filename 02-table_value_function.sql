---Using TVF(Table value function)----
USE AdvanceDB;

CREATE FUNCTION dbo.GetAllProduct()
RETURNS TABLE
AS
RETURN(
    SELECT Id, Name, Price, Quantity, CreatedDate 
    FROM dbo.Product
);
GO


CREATE FUNCTION dbo.GetProductByCategoryName(
    @CategoryName VARCHAR(20)
)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM dbo.Product
    WHERE CategoryId = (
        SELECT CategoryId 
        FROM dbo.Category
        WHERE Name = @CategoryName
    )
);
GO

CREATE FUNCTION dbo.GetProductByDateYouWant(
    @startingDate DATE, 
    @endingDate DATE
)
RETURNS TABLE
AS 
RETURN (
    SELECT Name, Price, Quantity, CreatedDate 
    FROM dbo.Product
    WHERE CreatedDate BETWEEN @startingDate AND @endingDate
);
GO

-----> Calling function TVF
SELECT * From dbo.GetAllProduct();

SELECT * FROM dbo.GetProductByCategoryName('Food');
SELECT * FROM dbo.GetProductByCategoryName('Electronics');

SELECT * FROM dbo.GetProductByDateYouWant('2026-03-27', '2026-03-30');