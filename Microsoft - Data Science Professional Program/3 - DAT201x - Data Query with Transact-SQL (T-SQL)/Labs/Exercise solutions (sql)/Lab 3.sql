
SELECT c.CompanyName, oh.SalesOrderID, oh.TotalDue
FROM [SalesLT].[Customer] AS c
INNER JOIN [SalesLT].[SalesOrderHeader] AS oh
ON c.CustomerID = oh.CustomerID;

##########

SELECT c.CompanyName, oh.SalesOrderID, oh.TotalDue, a.AddressLine1,
ISNULL(a.AddressLine2, '') AS AddressLine2, a.City, a.StateProvince, a.CountryRegion, a.PostalCode
FROM [SalesLT].[Customer] AS c
INNER JOIN [SalesLT].[SalesOrderHeader] AS oh
ON c.CustomerID = oh.CustomerID
INNER JOIN [SalesLT].[CustomerAddress] AS ca
ON c.CustomerID = ca.CustomerID and AddressType='Main Office'
INNER JOIN [SalesLT].[Address] AS a
ON ca.AddressID = a.AddressID

***********************************************************

SELECT c.CompanyName, c.FirstName, c.LastName, oh.SalesOrderID, oh.TotalDue
FROM [SalesLT].[Customer] AS c
LEFT JOIN [SalesLT].[SalesOrderHeader] AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY oh.SalesOrderID DESC;

***********************************************************

SELECT c.CustomerID, c.CompanyName, c.FirstName, c.LastName, c.Phone
FROM [SalesLT].[Customer] AS c 
LEFT JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
WHERE ca.AddressID IS NULL;

***********************************************************

SELECT c.CustomerID, p.ProductID
FROM [SalesLT].[Customer] AS c 
FULL JOIN [SalesLT].[SalesOrderHeader] AS oh 
ON c.CustomerID = oh.CustomerID
FULL JOIN [SalesLT].[SalesOrderDetail] AS od 
ON oh.SalesOrderID = od.SalesOrderID
FULL JOIN [SalesLT].[Product] AS p 
ON od.ProductID = p.ProductID
WHERE oh.SalesOrderID IS NULL
ORDER BY ProductID, CustomerID;
