-- Create and use the database
CREATE DATABASE warehouse_db;
USE warehouse_db;

-- Create Warehouses table
CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
);

-- Create Boxes table
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL,
    Value REAL NOT NULL,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
) ENGINE=INNODB;

-- Insert sample data into Warehouses
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

-- Insert sample data into Boxes
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE Value > 150;

SELECT DISTINCT Contents FROM Boxes;

SELECT AVG(Value) AS AverageValue FROM Boxes;

SELECT Warehouse, AVG(Value) AS AverageValue
FROM Boxes
GROUP BY Warehouse;

SELECT Warehouse, AVG(Value) AS AverageValue
FROM Boxes
GROUP BY Warehouse
HAVING AVG(Value) > 150;

SELECT b.Code, w.Location
FROM Boxes b
JOIN Warehouses w ON b.Warehouse = w.Code;

SELECT w.Code, COUNT(b.Code) AS BoxCount
FROM Warehouses w
LEFT JOIN Boxes b ON w.Code = b.Warehouse
GROUP BY w.Code;

SELECT w.Code
FROM Warehouses w
JOIN Boxes b ON w.Code = b.Warehouse
GROUP BY w.Code, w.Capacity
HAVING COUNT(b.Code) > w.Capacity;

SELECT b.Code
FROM Boxes b
JOIN Warehouses w ON b.Warehouse = w.Code
WHERE w.Location = 'Chicago';

INSERT INTO Warehouses (Code, Location, Capacity) VALUES (6, 'New York', 3);

INSERT INTO Boxes (Code, Contents, Value, Warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes
SET Value = Value * 0.85;

DELETE FROM Boxes WHERE Value < 100;

DELETE FROM Boxes
WHERE Warehouse IN (
    SELECT w.Code
    FROM Warehouses w
    JOIN Boxes b ON w.Code = b.Warehouse
    GROUP BY w.Code, w.Capacity
    HAVING COUNT(b.Code) > w.Capacity
);

CREATE INDEX idx_warehouse ON Boxes(Warehouse);

SHOW INDEX FROM Boxes;

DROP INDEX idx_warehouse ON Boxes;
