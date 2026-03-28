------Filtering Data-------
USE SchoolDB;

--// insert product for filter // --
INSERT INTO dbo.Products(Name, Price, Quantity) VALUES
('iPhone 14 Pro', 999, 5),
('Samsung Galaxy S23', 899, 8),
('MacBook Air M2', 1200, 3),
('Dell XPS 13', 1100, 4),
('HP Pavilion Laptop', 750, 6),
('Asus ROG Gaming Laptop', 1500, 2),
('Lenovo ThinkPad X1', 1300, 5),
('iPad Pro 11', 800, 7),
('Samsung Galaxy Tab S8', 700, 6),
('Apple Watch Series 9', 450, 9),
('Sony WH-1000XM5 Headphones', 400, 10),
('JBL Bluetooth Speaker', 150, 12),
('Logitech Wireless Mouse', 50, 15),
('Mechanical Keyboard RGB', 120, 8),
('USB-C Charger 65W', 40, 20),
('Power Bank 20000mAh', 60, 14),
('External SSD 1TB', 180, 7),
('SanDisk Flash Drive 128GB', 25, 30),
('Canon EOS M50 Camera', 650, 3),
('Nikon DSLR D3500', 500, 4),
('Smart TV 55 Inch Samsung', 900, 6),
('LG OLED TV 65 Inch', 1800, 2),
('Air Conditioner 1.5HP', 600, 5),
('Refrigerator Double Door', 700, 3),
('Microwave Oven Panasonic', 200, 8),
('Rice Cooker Philips', 90, 12),
('Electric Kettle', 35, 15),
('Blender Machine', 80, 9),
('Washing Machine LG', 750, 4),
('Vacuum Cleaner Dyson', 500, 3),
('Nike Air Force 1', 120, 10),
('Adidas Ultraboost', 150, 8),
('Puma Running Shoes', 100, 9),
('Men T-Shirt Cotton', 20, 25),
('Women Dress Casual', 35, 18),
('Jeans Denim Blue', 40, 20),
('Jacket Winter', 70, 10),
('Hoodie Unisex', 45, 12),
('Cap Baseball', 15, 30),
('Socks Pack 5', 10, 40),
('Coca Cola 1.5L', 2, 100),
('Pepsi 1.5L', 2, 95),
('Orange Juice 1L', 3, 80),
('Milk Fresh 1L', 2, 85),
('Mineral Water 500ml', 1, 200),
('Red Bull Energy Drink', 2, 70),
('Coffee Instant Nescafe', 5, 60),
('Green Tea Bottle', 2, 90),
('Chocolate Bar KitKat', 1, 120),
('Biscuits Oreo Pack', 2, 110),
('Apple Fruit 1kg', 3, 50),
('Banana 1 Dozen', 2, 60),
('Mango 1kg', 4, 40),
('Orange 1kg', 3, 55),
('Chicken Meat 1kg', 6, 35),
('Beef Meat 1kg', 8, 25),
('Pork Meat 1kg', 7, 30),
('Fish Fresh 1kg', 5, 28),
('Eggs 1 Tray', 4, 45),
('Rice Premium 5kg', 15, 20),
('Sugar 1kg', 2, 50),
('Salt 1kg', 1, 70),
('Cooking Oil 1L', 3, 60),
('Soy Sauce Bottle', 2, 55),
('Fish Sauce Bottle', 2, 50),
('Instant Noodles Pack', 3, 100),
('Spaghetti Pasta', 4, 40),
('Tomato Sauce Bottle', 2, 45),
('Cheese Slice Pack', 3, 35),
('Butter 250g', 2, 30),
('Office Chair Ergonomic', 150, 6),
('Wooden Desk Table', 200, 5),
('LED Desk Lamp', 25, 15),
('Notebook A4 100 pages', 3, 60),
('Pen Blue Ink', 1, 200),
('Marker Permanent', 2, 120),
('Backpack Laptop Bag', 40, 20),
('Water Bottle 1L', 10, 35),
('Lunch Box Plastic', 8, 25),
('Umbrella Folding', 12, 18),
('Gaming Mouse RGB', 60, 10),
('Gaming Headset', 80, 8),
('PS5 Console', 500, 3),
('Xbox Series X', 500, 2),
('Nintendo Switch', 300, 4),
('Gaming Monitor 27 Inch', 350, 6),
('Graphic Card RTX 4060', 600, 2),
('Processor Intel i7', 400, 3),
('RAM 16GB DDR4', 120, 10),
('SSD 512GB', 80, 12),
('Face Wash Cleanser', 10, 30),
('Shampoo Head & Shoulders', 6, 40),
('Body Lotion Nivea', 7, 35),
('Toothpaste Colgate', 3, 60),
('Toothbrush Oral-B', 2, 70),
('Perfume Dior', 120, 5),
('Deodorant Spray', 5, 45),
('Hand Sanitizer', 2, 80),
('Tissue Paper Pack', 3, 90),
('Wet Wipes Pack', 4, 75),
('Motorbike Helmet', 50, 15),
('Car Engine Oil', 25, 20),
('Bicycle Mountain Bike', 200, 5),
('Scooter Electric', 400, 3),
('Car Phone Holder', 10, 30),
('LED Flashlight', 8, 25),
('Extension Power Socket', 12, 18),
('Wall Clock', 15, 12),
('Bed Pillow', 20, 10),
('Mattress Queen Size', 300, 2);

--//Selete all not filter//--
SELECT * FROM dbo.Products;


---// Filter with keyword WHERE and follow requirment // ----
SELECT * FROM dbo.Products 
WHERE Quantity = 50;

SELECT Name, Quantity FROM dbo.Products
WHERE Price > 10;

SELECT Name FROM dbo.Products
WHERE Quantity <> 2;


---// Filter with Keyword AND,OR,NOT + Where follow requirement //---
SELECT * FROM dbo.Products 
WHERE Price >= 5 AND Quantity <= 10;

SELECT * FROM dbo.Products 
WHERE Price <= 5 OR Price >= 20 ;

SELECT * FROM dbo.Products
WHERE NOT Quantity >= 7; 

SELECT * FROM dbo.Products
WHERE Price >= 25 AND Price <=75;

SELECT Name, Price FROM dbo.Products
WHERE Price >= 10 AND Quantity = 2;


---// Filter with Keyword between follow requirement //---
SELECT Name , Quantity FROM dbo.Products
WHERE Price BETWEEN 5 AND 10; 

SELECT * FROM dbo.Products
WHERE Quantity BETWEEN 2 AND 10;


---// Filter with keyword In //---
SELECT * FROM dbo.Products
WHERE Quantity IN(2,5,9,15) ;

SELECT * FROM dbo.Products
WHERE Price IN(2.00, 3.00);



---// Filter with Keyword LIKE follow Requirement //---
-- i want product name start from character 'c'
SELECT * FROM dbo.Products
WHERE Name LIKE 'c%';

-- i want to product start from char 't' and 'c'
SELECT * FROM dbo.Products
WHERE Name LIKE 't%';

-- i want product end by char 'a'
SELECT Name FROM dbo.Products
WHERE Name LIKE '%a';

-- i want product name having container name 'ra'
SELECT Name FROM dbo.Products 
WHERE Name LIKE '%ra%';

--combine conndtion
SELECT * FROM dbo.Products
WHERE Name LIKE 'c%' AND Price >=10;

SELECT * FROM dbo.Products
WHERE Name LIKE 'c%' AND Name LIKE '%e';

