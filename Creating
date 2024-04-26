CREATE DATABASE INSURANCE

USE INSURANCE


CREATE TABLE Departments
(
"Department_Code" INT PRIMARY KEY,
"Department_Name" VARCHAR (25)
)

-- Inserting values into the table
INSERT INTO Departments
VALUES 
    (10, 'Management'),
    (20, 'Marketing'),
    (30, 'Sales'),
    (40, 'Service'),
    (50, 'Finance');

SELECT
	*
FROM
	Departments


CREATE TABLE Product
(
"Product_Id" INT PRIMARY KEY,
"Product_Name" VARCHAR (25),
"Price" INT
)

-- Inserting values into the table
INSERT INTO Product
VALUES 
    (100, 'Laptop', 2100),
    (200, 'Keyboard', 130),
    (300, 'Mouse', 70),
    (400, 'Printer', 320),
    (500, 'Screen', 570),
    (600, 'Hard Drive', 4);

UPDATE Product
SET PRICE = 400
WHERE Price = '4'

SELECT
	*
FROM
	Product

CREATE TABLE Employees
(
 "Emp_Nr" INT PRIMARY KEY ,
 "First Name" VARCHAR (25),
 "Last Name" VARCHAR (25),
 "Start_Work" INT,
 "Department_Code" INT ,
 "Salary" INT,
  FOREIGN KEY (Department_Code) REFERENCES Departments (Department_Code)
 )

SELECT 
	*
FROM
	Employees

-- Inserting values into the Employees table
INSERT INTO Employees 
VALUES
    (123, 'Yuval', 'Shaked', 2003, 20, 10000),
    (456, 'Tamar', 'Avraham', 2010, 30, 19000),
    (789, 'Noa', 'Noiman', 2011, 30, 15000),
    (111, 'Noam', 'Shavit', 2019, 10, 40000),
    (222, 'Noga', 'Zweig', 2008, 30, 25000),
    (333, 'Yonatan', 'Shalem', 2020, 50, 9000),
    (444, 'Gilad', 'Shavit', 2012, 40, 21000),
    (555, 'Noga', 'Levinson', 1999, 30, 17000),
    (487, 'Tal', 'Shaked', 2003, 20, 10000),
    (984, 'Batal', 'Daburi', 2010, 30, 1000);

SELECT 
	* 
FROM
	Employees


DROP TABLE SALES


CREATE TABLE SALES
(
"Emp_nr" INT NOT NULL,
"Product_Id" INT NOT NULL,
"Mounth" INT NOT NULL,
"Year" INT NOT NULL,
"Units" INT NULL
FOREIGN KEY (Emp_nr) REFERENCES Employees(Emp_nr),
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
)

-- Inserting values into the Employees table

INSERT INTO SALES 
VALUES
    (789, 400, 1, 2019, 5),
    (789, 200, 3, 2019, 16),
    (984, 100, 5, 2019, 10),
    (222, 500, 2, 2019, 3),
    (456, 100, 1, 2019, 6),
    (555, 300, 1, 2019, 20),
    (555, 600, 3, 2019, 13),
    (555, 200, 4, 2019, NULL);

SELECT
	*
FROM
	SALES