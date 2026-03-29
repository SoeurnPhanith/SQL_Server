----- Using Sorting and Filtering with grouping-----
USE SchoolDB;

DELETE FROM dbo.Products;

---// Alter category to table product //---
ALTER TABLE dbo.Products 
ADD category VARCHAR(25);
-- add 200 product into table
INSERT INTO dbo.Products(Name, Price, Quantity, category) VALUES
('iPhone 14 Pro',999,5,'Electronics'),
('Samsung Galaxy S23',899,8,'Electronics'),
('MacBook Air M2',1200,3,'Electronics'),
('Dell XPS 13',1100,4,'Electronics'),
('HP Pavilion Laptop',750,6,'Electronics'),
('Asus ROG Laptop',1500,2,'Electronics'),
('Lenovo ThinkPad',1300,5,'Electronics'),
('iPad Pro 11',800,7,'Electronics'),
('Samsung Tab S8',700,6,'Electronics'),
('Apple Watch Series 9',450,9,'Electronics'),

('Sony Headphones',400,10,'Electronics'),
('JBL Speaker',150,12,'Electronics'),
('Logitech Mouse',50,15,'Electronics'),
('Mechanical Keyboard',120,8,'Electronics'),
('USB-C Charger',40,20,'Electronics'),
('Power Bank 20000mAh',60,14,'Electronics'),
('External SSD 1TB',180,7,'Electronics'),
('Flash Drive 128GB',25,30,'Electronics'),
('Canon Camera',650,3,'Electronics'),
('Nikon DSLR',500,4,'Electronics'),

('Nike Air Force 1',120,10,'Clothes'),
('Adidas Ultraboost',150,8,'Clothes'),
('Puma Running Shoes',100,9,'Clothes'),
('Men T-Shirt',20,25,'Clothes'),
('Women Dress',35,18,'Clothes'),
('Jeans Denim',40,20,'Clothes'),
('Winter Jacket',70,10,'Clothes'),
('Hoodie',45,12,'Clothes'),
('Baseball Cap',15,30,'Clothes'),
('Socks Pack',10,40,'Clothes'),

('Coca Cola 1.5L',2,100,'Food'),
('Pepsi 1.5L',2,95,'Food'),
('Orange Juice',3,80,'Food'),
('Milk 1L',2,85,'Food'),
('Mineral Water',1,200,'Food'),
('Red Bull',2,70,'Food'),
('Nescafe Coffee',5,60,'Food'),
('Green Tea',2,90,'Food'),
('KitKat Chocolate',1,120,'Food'),
('Oreo Biscuits',2,110,'Food'),

('Apple Fruit',3,50,'Food'),
('Banana',2,60,'Food'),
('Mango',4,40,'Food'),
('Orange Fruit',3,55,'Food'),
('Chicken Meat',6,35,'Food'),
('Beef Meat',8,25,'Food'),
('Pork Meat',7,30,'Food'),
('Fish Fresh',5,28,'Food'),
('Eggs Tray',4,45,'Food'),
('Rice 5kg',15,20,'Food'),

('Office Chair',150,6,'Furniture'),
('Wood Desk',200,5,'Furniture'),
('Desk Lamp',25,15,'Furniture'),
('Notebook A4',3,60,'Stationery'),
('Pen Blue',1,200,'Stationery'),
('Marker',2,120,'Stationery'),
('Backpack',40,20,'Accessories'),
('Water Bottle',10,35,'Accessories'),
('Lunch Box',8,25,'Accessories'),
('Umbrella',12,18,'Accessories'),

('Gaming Mouse',60,10,'Electronics'),
('Gaming Headset',80,8,'Electronics'),
('PS5 Console',500,3,'Electronics'),
('Xbox Series X',500,2,'Electronics'),
('Nintendo Switch',300,4,'Electronics'),
('Gaming Monitor',350,6,'Electronics'),
('RTX 4060 GPU',600,2,'Electronics'),
('Intel i7 CPU',400,3,'Electronics'),
('RAM 16GB',120,10,'Electronics'),
('SSD 512GB',80,12,'Electronics'),

('Face Wash',10,30,'Cosmetics'),
('Shampoo',6,40,'Cosmetics'),
('Body Lotion',7,35,'Cosmetics'),
('Toothpaste',3,60,'Cosmetics'),
('Toothbrush',2,70,'Cosmetics'),
('Perfume Dior',120,5,'Cosmetics'),
('Deodorant',5,45,'Cosmetics'),
('Hand Sanitizer',2,80,'Cosmetics'),
('Tissue Paper',3,90,'Cosmetics'),
('Wet Wipes',4,75,'Cosmetics'),

-- continue pattern to reach 200
('Helmet',50,15,'Accessories'),
('Engine Oil',25,20,'Automotive'),
('Mountain Bike',200,5,'Automotive'),
('Electric Scooter',400,3,'Automotive'),
('Phone Holder',10,30,'Accessories'),
('Flashlight',8,25,'Accessories'),
('Power Socket',12,18,'Electronics'),
('Wall Clock',15,12,'Furniture'),
('Pillow',20,10,'Furniture'),
('Mattress',300,2,'Furniture'),

('Table Fan',45,14,'Electronics'),
('Air Conditioner',600,3,'Electronics'),
('Refrigerator',700,2,'Electronics'),
('Microwave',200,6,'Electronics'),
('Rice Cooker',90,10,'Electronics'),
('Blender',80,9,'Electronics'),
('Vacuum Cleaner',500,3,'Electronics'),
('Iron',35,12,'Electronics'),
('Hair Dryer',25,18,'Electronics'),
('Electric Stove',150,7,'Electronics'),

('T-shirt Black',22,20,'Clothes'),
('Dress Red',40,15,'Clothes'),
('Jeans Slim',45,18,'Clothes'),
('Sneakers White',110,12,'Clothes'),
('Jacket Leather',150,6,'Clothes'),
('Cap Sport',18,25,'Clothes'),
('Shorts',25,30,'Clothes'),
('Sweater',55,10,'Clothes'),
('Scarf',15,22,'Clothes'),
('Gloves',12,20,'Clothes'),

('Bread',2,80,'Food'),
('Butter',3,50,'Food'),
('Cheese',4,45,'Food'),
('Yogurt',2,60,'Food'),
('Ice Cream',5,40,'Food'),
('Pizza',8,30,'Food'),
('Burger',6,35,'Food'),
('Fries',3,50,'Food'),
('Hot Dog',4,45,'Food'),
('Fried Chicken',7,25,'Food');

---// Normally Sorting//---
SELECT * FROM dbo.Products
ORDER BY Id ASC;

SELECT Name, Price FROM dbo.Products 
ORDER BY Quantity DESC;


---// Aggregate Function//---
--1. Function Sum() : sum with specific column with new name using keyword AS
SELECT SUM(Quantity) AS Total_Quantity FROM dbo.Products;

SELECT SUM(Price) AS Total_Price FROM dbo.Products;

--2. Function Count() : for count of column 
SELECT COUNT(*) AS Total_Product FROM dbo.Products;

SELECT COUNT(category) AS Total_Category FROM dbo.Products;

--3. Function AVG() 
SELECT AVG(Price) AS Avg FROM dbo.Products;

SELECT AVG(Quantity) AS AVG_Qty FROM dbo.Products;

--. Function Max() and Min ()
SELECT MIN(Price) AS MIN_Price FROM dbo.Products;

SELECT Max(Price) AS Max_Price FROM dbo.Products;


---// Grouby(Combine with Agg Func)//---
SELECT
    category,
    COUNT(*) AS Total_Category
FROM dbo.Products 
GROUP BY category;

SELECT 
    Category,
    COUNT(*) AS TotalProducts,
    SUM(Price) AS TotalPrice
FROM dbo.Products
GROUP BY Category;

SELECT 
    Name,
    COUNT(Name) AS SameName,
    Max(Price) AS MaxPrice
FROM dbo.Products
GROUP BY Name;


---//Having (Use with Agg Func + Grouby)//---
SELECT 
    category, 
    COUNT(*) AS TotalProduct
FROM dbo.Products
GROUP BY category
HAVING COUNT(*) > 5;

SELECT 
    Price, 
    COUNT(*) AS TotalProduct,
    SUM(Price) AS TotalPrice
FROM dbo.Products
GROUP BY Price
HAVING SUM(Price) > 20
ORDER BY Price DESC;

SELECT 
    category,
    SUM(Price) AS TotalPrice
FROM dbo.Products
GROUP BY category 
HAVING SUM(Price) < 200
ORDER BY category;
