
SELECT 
	D.Department_Name,
	SUM (DISTINCT E.Salary) AS MounthlyPaymentForSalaries,
	COUNT(DISTINCT E.Emp_nr) AS CountOfMembers,
	SUM(COUNT(DISTINCT E.Emp_nr)) OVER () AS TotalCountOfMembers,
	AVG(DISTINCT E.Salary) AS AverageSalary
FROM
	Departments D
FULL JOIN
	Employees E
ON
	D.Department_Code = E.Department_Code
FULL JOIN
	SALES S
ON
	S.Emp_nr = E.Emp_Nr
FULL JOIN
	Product P 
ON
	P.Product_Id = S.Product_ID
GROUP BY
	D.Department_Name
ORDER BY 
	MounthlyPaymentForSalaries DESC;

	
