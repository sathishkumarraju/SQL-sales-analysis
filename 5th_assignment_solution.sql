
CREATE DATABASE parts_db;
USE parts_db;

-- Create Pieces table
CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
);

-- Create Providers table
CREATE TABLE Providers (
 Code VARCHAR(40) PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
);

-- Create Provides table
CREATE TABLE Provides (
 Piece INTEGER,
 Provider VARCHAR(40),
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider),
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 FOREIGN KEY (Provider) REFERENCES Providers(Code)
);

-- Insert data into Providers
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

-- Insert data into Pieces
INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

-- Insert data into Provides
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);

SELECT Name FROM Pieces;

SELECT * FROM Providers;

SELECT Piece, AVG(Price) AS AveragePrice
FROM Provides
GROUP BY Piece;

SELECT p.Name
FROM Providers p
JOIN Provides pr ON p.Code = pr.Provider
WHERE pr.Piece = 1;

SELECT pi.Name
FROM Pieces pi
JOIN Provides pr ON pi.Code = pr.Piece
WHERE pr.Provider = 'HAL';

SELECT pi.Name AS PieceName, prd.Name AS ProviderName, pr.Price
FROM Provides pr
JOIN Pieces pi ON pr.Piece = pi.Code
JOIN Providers prd ON pr.Provider = prd.Code
WHERE pr.Price = (
    SELECT MAX(pr2.Price)
    FROM Provides pr2
    WHERE pr2.Piece = pr.Piece
);

INSERT INTO Provides (Piece, Provider, Price)
VALUES (1, 'TNBC', 7);

UPDATE Provides
SET Price = Price + 1;

DELETE FROM Provides
WHERE Provider = 'RBT' AND Piece = 4;

DELETE FROM Provides
WHERE Provider = 'RBT';
