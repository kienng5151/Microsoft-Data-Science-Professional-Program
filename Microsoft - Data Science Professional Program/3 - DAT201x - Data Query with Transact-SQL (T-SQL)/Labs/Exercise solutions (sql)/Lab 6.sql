
SELECT ProductID, Name, ListPrice
FROM [SalesLT].[Product]
WHERE ListPrice > (SELECT AVG(UnitPrice) FROM [SalesLT].[SalesOrderDetail])
ORDER BY ProductID;

#############

SELECT ProductID, Name, ListPrice
FROM [SalesLT].[Product]
WHERE ProductID IN (SELECT ProductID FROM [SalesLT].[SalesOrderDetail] WHERE UnitPrice < 100)
AND ListPrice >= 100
ORDER BY ProductID;

***********************************************************

SELECT ProductID, Name, StandardCost, ListPrice,
(SELECT AVG(UnitPrice) FROM [SalesLT].[SalesOrderDetail] AS od 
	WHERE p.ProductID = od.ProductID) AS AverageSellingPrice
FROM [SalesLT].[Product] AS p 
ORDER BY p.ProductID;

***********************************************************

SELECT ProductID, Name, StandardCost, ListPrice,
(SELECT AVG(UnitPrice) FROM [SalesLT].[SalesOrderDetail] AS od 
	WHERE p.ProductID = od.ProductID) AS AverageSellingPrice
FROM [SalesLT].[Product] AS p 
WHERE StandardCost > (SELECT AVG(UnitPrice) FROM [SalesLT].[SalesOrderDetail] AS od 
			WHERE p.ProductID = od.ProductID)
ORDER BY p.ProductID;

***********************************************************

SELECT oh.SalesOrderID, oh.CustomerID, ci.FirstName, ci.LastName, oh.TotalDue
FROM [SalesLT].[SalesOrderHeader] AS oh 
CROSS APPLY dbo.ufnGetCustomerInformation(oh.CustomerID) AS ci
ORDER BY oh.SalesOrderID;

***********************************************************

SELECT ca.CustomerID, ci.FirstName, ci.LastName, a.AddressLine1, a.City
FROM [SalesLT].[Address] AS a  
JOIN [SalesLT].[CustomerAddress] AS ca 
ON a.AddressID = ca.AddressID
CROSS APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS ci
ORDER BY ca.CustomerID;
