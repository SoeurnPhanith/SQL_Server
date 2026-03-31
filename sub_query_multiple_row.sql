--- *** Use Multiple row Sub Query for filter *** ---
USE AdvanceDB;

--//View all//--
SELECT * FROM dbo.Product;

SELECT * FROM dbo.Category;
--Want all product having category Food and Fashion
SELECT * FROM dbo.Product
WHERE CategoryId IN(
    SELECT CategoryId
    FROM dbo.Category
    WHERE Name IN('Food','Fashion')
);

--Want all product having qty 2, 6, 8
SELECT * 
FROM dbo.Product
WHERE Quantity IN(
    SELECT Quantity
    FROM dbo.Product
    WHERE Quantity IN(2,6,8)
);

--Compare price with all category(2) if more than is showing
SELECT *
FROM Product
WHERE Price > ALL (
    SELECT Price FROM Product WHERE CategoryId = 2
);

SELECT *
FROM Product
WHERE Price > ANY (
    SELECT Price FROM Product WHERE CategoryId = 1
);

--find exists category
SELECT *
FROM Category c
WHERE EXISTS (
    SELECT 1 
    FROM Product p
    WHERE p.CategoryId = c.CategoryId
);


SELECT *
FROM Product
WHERE CategoryId IN (
    SELECT CategoryId
    FROM Product
    GROUP BY CategoryId
    HAVING COUNT(*) > 5
);


SELECT *
FROM Product
WHERE CategoryId NOT IN (
    SELECT CategoryId
    FROM Product
    WHERE CategoryId NOT IN(1,4)
);

