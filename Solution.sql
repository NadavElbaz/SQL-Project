---  Number 1

SELECT
	 [First Name],
	 COUNT([First Name]) AS 'CountOfDisplayingFN'
FROM
	Employees
GROUP BY [First Name]

--- Number 2

SELECT TOP 1
	 [First Name],
	 COUNT([First Name]) AS 'NUMBERS OF APPEARING'
FROM
	Employees

GROUP BY [First Name]
ORDER BY 'NUMBERS OF APPEARING' DESC;

--- Way #2

SELECT
	[First Name],
	COUNT([First Name]) AS NumbersOfAppearing
FROM
	Employees E
GROUP BY
	[First Name]
HAVING
	COUNT([First Name]) > '1';

--- Way #3 

SELECT 
	 [First Name],
	 COUNT([First Name]) AS 'NUMBERS OF APPEARING'
FROM
	Employees

GROUP BY [First Name]

EXCEPT 

SELECT 
 [First Name],
 COUNT([First Name]) AS 'NUMBERS OF APPEARING'
FROM
	Employees
GROUP BY [First Name]
HAVING COUNT([First Name])  = '1' 

--- Number 3

SELECT 
	[First Name],
	[Last Name],
	[Start_Work],
	D.Department_Name
FROM
	Employees E
LEFT JOIN
	Departments D	
ON
	E.Department_Code = D.Department_Code
WHERE 
	D.Department_Name IN ('Marketing','Service')
AND
	E.Start_Work < '2015'
ORDER BY E.Start_Work ASC;

--- Number 4

SELECT
	Product_Name
FROM
	Product
WHERE Price BETWEEN 250 AND 600;

--- Number 5

SELECT 
	[First Name],
	[Last Name]
FROM
	Employees E
LEFT JOIN
	SALES S
ON 
	E.Emp_Nr = S.Emp_nr 
LEFT JOIN 
	Product P
ON
	S.Product_Id = P.Product_Id
WHERE
	Salary > '20000' 
OR 
	P.Product_Name = 'Mouse';

--- Number 6

SELECT TOP 1  
	[Last Name]
FROM
	Employees E
LEFT JOIN 
	SALES S
ON
	E.Emp_Nr = S.Emp_nr 
LEFT JOIN
	Product P
ON
	S.Product_Id = P.Product_Id
WHERE
	P.Product_Name = 'Keyboard'
ORDER BY [Last Name] ASC;

--- Number 7

SELECT
	*,
	CASE
		WHEN Price >= 500
			THEN 'Expensive'
			ELSE  'Cheap'
		END AS ProductValue
FROM
	Product P

--- Number 8

SELECT
	E.[First Name] + ' ' + E.[Last Name] AS 'Full_Name',
	T1.ProductValue ProductValue,
	COUNT(E.Emp_nr) TOTAL_SALES	
FROM
	SALES S
INNER JOIN
	Employees E
ON 
	E.Emp_Nr = S.Emp_nr
INNER JOIN
	(SELECT
		*,
		CASE
		WHEN Price >= 500
			THEN 'Expensive'
			ELSE  'Cheap'
		END AS ProductValue
	FROM
		Product P) T1
ON
	T1.Product_Id = S.Product_Id
GROUP BY
	T1.ProductValue,E.[First Name],E.[Last Name]
ORDER BY 
	T1.ProductValue

--- Number 9

SELECT 
	[First Name],
	[Last Name],
	Salary
FROM
	Employees E

WHERE Department_Code  = 
	(SELECT
	Department_Code
FROM
	Employees 
WHERE Emp_Nr = '123');

--- Number 10

SELECT
	[First Name],
	[Last Name],
	CONCAT(
	LEFT([First Name], 1),
	LEFT([Last Name], 2),
	(Emp_Nr),
	'@computer.co.il' 
	) AS 'New_Employee_Adress'
FROM
	Employees;

--- Number 11

SELECT
	[First Name] +' '+ [Last Name] AS 'Employee_Full_Name',
	Departments.Department_Name,
	Product.Product_Name,
	SUM(SALES.Units) AS Sum_Of_Employee_Sales
FROM
	Employees 
LEFT JOIN
	Departments
ON
	Employees.Department_Code = Departments.Department_Code
LEFT JOIN
	SALES 
ON
	Employees.Emp_Nr = SALES.Emp_nr
INNER JOIN
	Product
ON
	SALES.Product_Id = Product.Product_Id
WHERE Employees.Start_Work > '2010'

GROUP BY
	Product.Product_Name,
	SALES.Emp_nr, 
	[First Name], 
	[Last Name], 
	Departments.Department_Name;

--- Another Way for Solving, but the name is separtly

SELECT
	DISTINCT[First Name],
	[Last Name],
	Product_Name,
	SALES.Units
FROM 
	Employees
LEFT JOIN 
	SALES ON Employees.Emp_Nr = SALES.Emp_nr
INNER JOIN 
	Product ON SALES.Product_Id = PRODUCT.Product_Id
WHERE Start_Work > '2010';

--- Number 12

SELECT TOP 1
	Employees.[First Name],
	Employees.[Last Name],
	Product.Product_Name,
	Product.Price,
	SALES.Units,
	SALES.Year,
	SALES.Mounth
FROM
	Employees
INNER JOIN
	SALES
ON 
	Employees.Emp_Nr = SALES.Emp_nr
INNER JOIN
	Product
ON 
	SALES.Product_Id = Product.Product_Id
WHERE
	EMPLOYEES.Emp_Nr = '555'
ORDER BY
	SALES.Year DESC,
	SALES.Mounth DESC;