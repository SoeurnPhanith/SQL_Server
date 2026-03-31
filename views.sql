---Todo View---
USE advanceDB;
--Create View

CREATE VIEW dbo.vw_ProductSummary AS
SELECT Name, Price, Quantity, CategoryId
FROM Product
WHERE Quantity > 0;


CREATE VIEW dbo.vw_ProductFoodOnly AS
SELECT * FROM dbo.product
WHERE CategoryId = (
    SELECT CategoryId
    FROM dbo.Category
    WHERE Name = 'Food'
)

CREATE VIEW dbo.vw_ProductFilterDate AS 
SELECT * FROM dbo.product
WHERE createdDate BETWEEN '2026-03-24' AND '2026-03-31';

CREATE VIEW dbo.vw_ProductFilterNameUsingLike AS
SELECT * FROM dbo.Product
WHERE Name LIKE 'i%';


--Use View
SELECT * FROM dbo.vw_ProductSummary;

SELECT * FROM dbo.vw_ProductFoodOnly;

SELECT * FROM dbo.vw_ProductFilterDate;

SELECT * FROM dbo.vw_ProductFilterNameUsingLike;


--Update View
UPDATE dbo.vw_ProductSummary
SET Price = Price + 2.00
WHERE Name = 'Orange';
