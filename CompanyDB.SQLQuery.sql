-- Create Databse
CREATE DATABASE CompanyDB
GO
-- Use Database
USE CompanyDB
GO
-- Create Tables
CREATE TABLE Departments(
             DepartmentID INT PRIMARY KEY IDENTITY(1,1),
             DepartmentName VARCHAR(50) NOT NULL,
             DepartmentLocation VARCHAR(50) NOT NULL
);
CREATE TABLE Employees(
             EmployeeID INT PRIMARY KEY IDENTITY(1,1),
             FirstName VARCHAR(50) NOT NULL,
             LastName VARCHAR(50) NOT NULL,
             Age INT NOT NULL,
             Gender VARCHAR(10) NOT NULL,
             Salary INT NOT NULL,
             DepartmentID INT, 
             FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert Data
INSERT INTO Departments(DepartmentName,DepartmentLocation)
       VALUES('IT','Pretoria'),
             ('Finance','Johannesburg'),
             ('Sales','Cape Town'),
             ('Marketing','Durban'),
             ('HR','Pretoria');
INSERT INTO Employees(FirstName,LastName,Age,Gender,Salary,DepartmentID)
       VALUES('Ayanda','Mthembu',28,'Female',24000,1),
             ('Brian','Dube',35,'Male',18000,2),
             ('Amanda','Pillay',22,'Female',32000,3),
             ('David','Mokoena',41,'Male',35000,5),
             ('Lindiwe','Zulu',29,'Female',14500,4),
             ('Peter','Mahlangu',31,'Male',21000,1),
             ('Anna','Botha',25,'Female',19500,2),
             ('John','Nkosi',21,'Male',12000,3),
             ('Nomsa','Khumalo',33,'Female',28000,5),
             ('Alex','Naidoo',27,'Male',30500,4);
-- Display all Departments & Employees
SELECT * FROM Departments;
SELECT * FROM Employees;
-- INSERT
INSERT INTO Employees(FirstName,LastName,Age,Gender,Salary,DepartmentID)
       VALUES('Thabo','Nkosi',29,'Male',22000,1);
SELECT * FROM Employees;
INSERT INTO Employees(FirstName,LastName,Age,Gender,Salary,DepartmentID)
       VALUES('Lerato','Mokoena',26,'Male',19500,2);
SELECT * FROM Employees;
INSERT INTO Employees(FirstName,LastName,Age,Gender,Salary,DepartmentID)
       VALUES('Kabelo','Dlamini',32,'Male',27000,3);
SELECT * FROM Employees;
-- SELECT
SELECT * FROM Employees;
SELECT * FROM Employees WHERE Salary>20000;
SELECT * FROM Employees WHERE Age>=25 AND Age<=35;
SELECT TOP 5 * FROM Employees
ORDER BY Salary DESC;
SELECT FirstName,LastName,Salary FROM Employees;
SELECT Gender FROM Employees WHERE Gender='Female';
SELECT AVG(Salary) FROM Employees;
SELECT COUNT(*) FROM Employees;
--UPDATE
UPDATE Employees SET Salary=Salary*1.10;
SELECT * FROM Employees;
UPDATE Employees SET Salary=Salary*1.15
WHERE DepartmentID=1;
SELECT * FROM Employees;
UPDATE Employees SET DepartmentID=1
WHERE EmployeeID=3;
SELECT * FROM Employees;
UPDATE Employees SET Salary=Salary*0.95
WHERE Salary>30000;
SELECT * FROM Employees;
-- DELETE
DELETE FROM Employees WHERE FirstName='Peter';
SELECT * FROM Employees;
DELETE FROM Employees WHERE Age<22;
SELECT * FROM Employees;
DELETE FROM Employees WHERE EmployeeID=11;
SELECT * FROM Employees;
DELETE FROM Employees WHERE DepartmentID=4;
SELECT * FROM Employees;
DELETE FROM Employees WHERE Salary<15000;
SELECT * FROM Employees;
-- Inner Join
SELECT Employees.FirstName,Employees.LastName,Departments.DepartmentName,Departments.DepartmentLocation,Employees.Salary
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID=Departments.DepartmentID;
                            -- DONE--