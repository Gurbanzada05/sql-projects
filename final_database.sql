CREATE DATABASE sql_final_project;
USE sql_final_project;

SELECT k.CategoryName, COUNT(*) as ProductCount
FROM products p
JOIN kateqoriyalar k 
ON p.CategoryID = k.CategoryID
GROUP BY k.CategoryName;

SELECT k.CategoryName, ROUND(AVG(p.Price), 2) AS AvgPrice
FROM PRODUCTS p
JOIN KATEQORİYALAR k ON p.CategoryID = k.CategoryID
GROUP BY k.CategoryName;

SELECT Class, COUNT(*) AS ProductCount
FROM PRODUCTS
GROUP BY Class;

SELECT ProductName, Price
FROM PRODUCTS
WHERE IsAllergic = "The product can be allergic";

SELECT FirstName, LastName, HireDate
FROM employees
ORDER BY HireDate ASC
LIMIT 5;

SELECT Gender, COUNT(*) AS EmployeeCount
FROM employees
GROUP BY Gender;

SELECT 
  FirstName, 
  LastName,
  TIMESTAMPDIFF(YEAR, STR_TO_DATE(BirthDate, '%m/%d/%Y'), CURDATE()) AS Age,
  TIMESTAMPDIFF(YEAR, STR_TO_DATE(HireDate, '%m/%d/%Y'), CURDATE()) AS YearsEmployed
FROM employees;
