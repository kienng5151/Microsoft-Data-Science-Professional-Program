
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight 
FROM [SalesLT].[Product];

##############

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, 
YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth
FROM [SalesLT].[Product]
ORDER BY SellStartYear;

***********************************************************

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, 
YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth
FROM [SalesLT].[Product]
LEFT(ProductNumber, 2) AS ProductType
ORDER BY SellStartYear;

***********************************************************

SELECT ProductID, UPPER(Name) AS ProductName, 
ROUND(Weight, 0) AS ApproxWeight, 
YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth, 
LEFT(ProductNumber, 2) AS ProductType
FROM [SalesLT].[Product]
WHERE ISNUMERIC(Size) = 1;

***********************************************************

SELECT c.CompanyName, oh.TotalDue AS REVENUE, 
	RANK() OVER(ORDER BY TotalDue DESC) AS RankByRevenue
FROM [SalesLT].[Customer] AS c 
JOIN [SalesLT].[SalesOrderHeader] AS oh 
ON c.CustomerID = oh.CustomerID;

***********************************************************

SELECT p.Name, SUM(od.LineTotal) AS TotalRevenue
FROM [SalesLT].[Product] AS p 
JOIN [SalesLT].[SalesOrderDetail] AS od 
ON p.ProductID = od.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

***********************************************************

SELECT p.Name, SUM(od.LineTotal) AS TotalRevenue
FROM [SalesLT].[Product] AS p 
JOIN [SalesLT].[SalesOrderDetail] AS od 
ON p.ProductID = od.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

***********************************************************

SELECT p.Name, SUM(od.LineTotal) AS TotalRevenue
FROM [SalesLT].[Product] AS p 
JOIN [SalesLT].[SalesOrderDetail] AS od 
ON p.ProductID = od.ProductID
WHERE p.ListPrice > 1000 
GROUP BY p.Name
HAVING SUM(od.LineTotal) > 20000
ORDER BY TotalRevenue DESC;
