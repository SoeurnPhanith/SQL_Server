------ Store Procedure---------
USE advanceDB;

---Create procedure for get data---
CREATE PROCEDURE GetAllCategory
AS 
BEGIN
    SELECT * From dbo.Category
END;
GO

CREATE PROCEDURE GetAllProductHavingFoodCategory
AS 
BEGIN
    SELECT * FROM dbo.Product 
    WHERE CategoryId = (
        SELECT CategoryId 
        FROM dbo.Category
        WHERE Name = 'Food'
    );
END;
GO

CREATE PROCEDURE GetAProductHighestPrice
AS 
BEGIN 
    SELECT * FROM dbo.Product
    WHERE Price = (
        SELECT MAX(Price) AS highestPrice
        FROM dbo.Product
    )
END;
GO

CREATE PROCEDURE GetTotalPriceWithGroupingCategory
AS
BEGIN
    SELECT c.Name,
           COUNT(*) AS TotalCategory,
           SUM(p.Price) AS TotalPriceAtThisCategory
    FROM dbo.Product p
    INNER JOIN dbo.Category c
        ON p.CategoryId = c.CategoryId
    GROUP BY c.Name
    ORDER BY SUM(p.Price) ASC;
END;
GO

CREATE PROCEDURE GetSomeDataFromProductAndCategoryTable
AS
BEGIN
    SELECT p.Id,
           p.Name,
           c.Name AS CategoryName,
           p.Price,
           p.Quantity
    FROM dbo.Product p 
    INNER JOIN dbo.Category c 
        ON p.CategoryId = c.CategoryId;
END;
GO

---Create Procedure for insert data with parameter---
CREATE PROCEDURE AddDataToProduct
    @Name NVARCHAR(100),
    @Price DECIMAL(10,2),
    @Quantity INT,
    @CategoryId INT
AS
BEGIN
    INSERT INTO dbo.Product(Name,Price,Quantity,CategoryId)
    VALUES (@Name,@Price,@Quantity,@CategoryId);
END;
GO

---Create Procedure for update data---
CREATE PROCEDURE UpdateProduct
    @Id INT,
    @Name NVARCHAR(100) = NULL,
    @Price DECIMAL(10,2) = NULL,
    @Quantity INT = NULL,
    @CategoryId INT = NULL
AS
BEGIN
    UPDATE dbo.Product
    SET Name = ISNULL(@Name, Name),
        Price = ISNULL(@Price, Price),
        Quantity = ISNULL(@Quantity, Quantity),
        CategoryId = ISNULL(@CategoryId, CategoryId)
    WHERE Id = @Id;

    PRINT 'Update Success';
END;
GO

---Create Procedure for delete data---
CREATE PROCEDURE DeleteProduct
    @Id INT
AS
BEGIN
    DELETE FROM dbo.Product
    WHERE Id = @Id;

    PRINT 'Delete Success';
END;
GO


--Using all procedure
EXEC GetAllCategory;
EXEC GetAllProductHavingFoodCategory;
EXEC GetAProductHighestPrice;
EXEC GetTotalPriceWithGroupingCategory;
EXEC GetSomeDataFromProductAndCategoryTable;

--insert
EXEC AddDataToProduct 'Hanuman',0.75,12,3;
EXEC AddDataToProduct 'Cambodia',0.75,12,3; 
EXEC AddDataToProduct 'GBZ',0.75,12,3; 
EXEC AddDataToProduct 'Cambodia-White',0.75,12,3; 
EXEC AddDataToProduct 'Jinroo',0.75,12,3;  

--update
EXEC UpdateProduct @Id=1006, @Name='Jinro'; 

--delete
EXEC DeleteProduct 1006;