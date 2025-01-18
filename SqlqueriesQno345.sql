-- 3.	Write a SQL query to insert employees having no experience to Database2 in Employee Table.
USE Database2;
SELECT * FROM Employee;

INSERT INTO Employee (Id, Employee) 
SELECT e.Id, e.Name  FROM Database1.dbo.Employee e 
LEFT JOIN Database1.dbo.Experience ex ON e.Id = ex.EmployeeId 
WHERE ex.EmployeeId IS NULL;

-- 4.	Write a SQL query to get number of employees working in each Department

USE Database1;
SELECT * FROM Employee;

SELECT Department, COUNT(*) AS NumberOfEmployees FROM Employee GROUP BY Department;


-- 5.	Write a SQL query to find those employees who have earned more than Estimated Salary.

SELECT e.Name, e.Department, e.YearlyEstimatedSalary, SUM(s.Salary) AS TotalSalary 
FROM Employee e 
JOIN Salary s ON e.Id = s.EmployeeId 
GROUP BY e.Name, e.Department, e.YearlyEstimatedSalary 
HAVING SUM(s.Salary) > e.YearlyEstimatedSalary; 
