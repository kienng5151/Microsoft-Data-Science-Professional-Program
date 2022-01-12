
SELECT p.ProductID, p.Name AS ProductName, cd.Name AS ProductModel, cd.Summary
FROM [SalesLT].[Product] as p 
JOIN [SalesLT].[vProductModelCatalogDescription] AS cd 
ON p.ProductModelID = cd.ProductModelID
ORDER BY ProductID;

################

DECLARE @Colors AS TABLE (Color varchar(15));
INSERT INTO @Colors
SELECT DISTINCT Color 
FROM [SalesLT].[Product];

SELECT ProductID, Name, Color 
FROM [SalesLT].[Product]
WHERE Color IN (SELECT Color FROM @Colors);

*******************************************************

SELECT cat.ParentProductCategoryName AS ParentCategory, 
	cat.ProductCategoryName AS ProductCategory,
	p.ProductID, 
	p.Name AS ProductName
FROM [SalesLT].[Product] AS p 
JOIN dbo.ufnGetAllCategories() AS cat 
ON p.ProductCategoryID = cat.ProductCategoryID
ORDER BY ParentCategory, ProductCategory;

*******************************************************

SELECT Company, SUM(SalesAmount) AS TotalRevenue
FROM
	(SELECT CONCAT (c.CompanyName, CONCAT('(' + c.FirstName + ' ', c.LastName + ')')), 
		oh.TotalDue
	FROM [SalesLT].[Customer] AS c 
	JOIN [SalesLT].[SalesOrderHeader] AS oh 
	ON c.CustomerID = oh.CustomerID) AS CustomerSales(Company, SalesAmount)
GROUP BY Company
ORDER BY Company;
