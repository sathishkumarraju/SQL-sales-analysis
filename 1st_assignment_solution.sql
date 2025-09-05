use store_db;


-- Create Manufacturers table
CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

-- Create Products table
CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  Price DECIMAL NOT NULL,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

-- Insert sample data into Manufacturers
INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

-- Insert sample data into Products
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
select *from Manufacturers;
SELECT Name FROM Products;
SELECT Name FROM Products;
SELECT Name FROM Products WHERE Price <= 200;
SELECT * FROM Products WHERE Price BETWEEN 60 AND 120;
SELECT Name, Price * 100 AS PriceInCents FROM Products;
SELECT AVG(Price) AS AveragePrice FROM Products;
SELECT AVG(Price) AS AvgPrice FROM Products WHERE Manufacturer = 2;
SELECT COUNT(*) AS ProductCount FROM Products WHERE Price >= 180;
SELECT Name, Price FROM Products WHERE Price >= 180 ORDER BY Price DESC, Name ASC;
SELECT p.*, m.* FROM Products p JOIN Manufacturers m ON p.Manufacturer = m.Code;
SELECT p.Name AS ProductName, p.Price, m.Name AS ManufacturerName
FROM Products p JOIN Manufacturers m ON p.Manufacturer = m.Code;
SELECT Manufacturer, AVG(Price) AS AvgPrice FROM Products GROUP BY Manufacturer;
SELECT m.Name, AVG(p.Price) AS AvgPrice
FROM Products p JOIN Manufacturers m ON p.Manufacturer = m.Code
GROUP BY m.Name;
SELECT m.Name
FROM Products p JOIN Manufacturers m ON p.Manufacturer = m.Code
GROUP BY m.Name HAVING AVG(p.Price) >= 150;
SELECT Name, Price FROM Products ORDER BY Price ASC LIMIT 1;
SELECT m.Name AS ManufacturerName, p.Name AS ProductName, p.Price
FROM Products p JOIN Manufacturers m ON p.Manufacturer = m.Code
WHERE p.Price = (
  SELECT MAX(p2.Price) FROM Products p2 WHERE p2.Manufacturer = p.Manufacturer
);
INSERT INTO Products (Name, Price, Manufacturer) VALUES ('Loudspeakers', 70, 2);
UPDATE Products SET Name = 'Laser Printer' WHERE Code = 8;
UPDATE Products SET Price = Price * 0.9;
UPDATE Products SET Price = Price * 0.9 WHERE Price >= 120;