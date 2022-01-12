
SELECT a.CountryRegion, a.StateProvince, SUM(oh.TotalDue) AS SalesRevenue
FROM [SalesLT].[Address] AS a 
JOIN [SalesLT].[CustomerAddress] as ca ON a.AddressID = ca.AddressID
JOIN [SalesLT].[Customer] AS c ON ca.CustomerID = c.CustomerID
JOIN [SalesLT].[SalesOrderHeader] AS oh ON c.CustomerID = oh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

###########################

SELECT a.CountryRegion, a.StateProvince, 
IIF(GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1, 'Total',
IIF(GROUPING_ID(a.StateProvince) = 1, a.CountryRegion + ' Subtotal', a.StateProvince + ' Subtotal')) AS Level,
SUM(oh.TotalDue) AS SalesRevenue
FROM [SalesLT].[Address] AS a 
JOIN [SalesLT].[CustomerAddress] AS ca ON a.AddressID = ca.AddressID
JOIN [SalesLT].[Customer] AS c ON ca.CustomerID = c.CustomerID
JOIN [SalesLT].[SalesOrderHeader] AS oh ON c.CustomerID = oh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

***********************************************************

SELECT * FROM
	(SELECT c.CompanyName, cat.ParentProductCategoryName, od.LineTotal 
	FROM [SalesLT].[SalesOrderDetail] AS od 
	JOIN [SalesLT].[SalesOrderHeader] AS oh 
	ON od.SalesOrderID = oh.SalesOrderID
	JOIN [SalesLT].[Customer] AS c 
	ON oh.CustomerID = c.CustomerID
	JOIN [SalesLT].[Product] AS p 
	ON p.ProductID = od.ProductID
	JOIN [SalesLT].[vGetAllCategories] AS cat 
	ON p.ProductCategoryID = cat.ProductCategoryID) AS categorysales
PIVOT(SUM(LineTotal) FOR ParentProductCategoryName 
	IN ([Accessories], [Bikes], [Clothing], [Components])) AS ptivotsales
ORDER BY CompanyName;

