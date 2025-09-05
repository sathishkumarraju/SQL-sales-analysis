CREATE DATABASE company_db;
USE company_db;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Budget DECIMAL NOT NULL
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Department INTEGER NOT NULL,
  FOREIGN KEY (Department) REFERENCES Departments(Code)
);

-- Insert sample data into Departments
INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

-- Insert sample data into Employees
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(123234877,'Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(152934485,'Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(222364883,'Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(326587417,'Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(332154719,'Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(332569843,'George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(546523478,'John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(631231482,'David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(654873219,'Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(745685214,'Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(845657245,'Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(845657246,'Kumar','Swamy',14);
SELECT LastName FROM Employees;
SELECT DISTINCT LastName FROM Employees;
SELECT * FROM Employees WHERE LastName = 'Smith';
SELECT * FROM Employees WHERE LastName IN ('Smith', 'Doe');
SELECT * FROM Employees WHERE Department = 14;
SELECT * FROM Employees WHERE Department IN (37, 77);
SELECT * FROM Employees WHERE LastName LIKE 'S%';
SELECT SUM(Budget) AS TotalBudget FROM Departments;
SELECT Department, COUNT(*) AS EmployeeCount FROM Employees GROUP BY Department;
SELECT e.*, d.*
FROM Employees e
JOIN Departments d ON e.Department = d.Code;
SELECT e.Name, e.LastName, d.Name AS DepartmentName, d.Budget
FROM Employees e
JOIN Departments d ON e.Department = d.Code;
SELECT e.Name, e.LastName
FROM Employees e
JOIN Departments d ON e.Department = d.Code
WHERE d.Budget > 60000;
SELECT *
FROM Departments
WHERE Budget > (SELECT AVG(Budget) FROM Departments);
SELECT d.Name
FROM Departments d
JOIN Employees e ON d.Code = e.Department
GROUP BY d.Name
HAVING COUNT(e.SSN) > 2;
SELECT e.Name, e.LastName
FROM Employees e
JOIN Departments d ON e.Department = d.Code
WHERE d.Budget = (
    SELECT DISTINCT Budget
    FROM Departments
    ORDER BY Budget ASC
    LIMIT 1 OFFSET 1
);
INSERT INTO Departments (Code, Name, Budget) VALUES (11, 'Quality Assurance', 40000);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES (847219811, 'Mary', 'Moore', 11);
UPDATE Departments
SET Budget = Budget * 0.9;
UPDATE Employees
SET Department = 14
WHERE Department = 77;
DELETE FROM Employees WHERE Department = 14;
DELETE FROM Employees
WHERE Department IN (
    SELECT Code FROM Departments WHERE Budget >= 60000
);

DELETE FROM Employees;
