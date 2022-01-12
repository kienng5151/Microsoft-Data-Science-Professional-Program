
SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM [SalesLT].[Customer] AS c
LEFT JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
LEFT JOIN [SalesLT].[Address] AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType='Main Office';

##############

SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType FROM [SalesLT].[Customer] AS c
LEFT JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
LEFT JOIN [SalesLT].[Address] AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType='Shipping';

***********************************************************

SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM [SalesLT].[Customer] AS c
LEFT JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
LEFT JOIN [SalesLT].[Address] AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType='Main Office'
UNION ALL
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType 
FROM [SalesLT].[Customer] AS c
LEFT JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
LEFT JOIN [SalesLT].[Address] AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType='Shipping'
ORDER BY c.CompanyName, AddressType;

***********************************************************

SELECT c.CompanyName
FROM [SalesLT].[Customer] AS c 
JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
JOIN [SalesLT].[Address] AS a 
ON ca.AddressID = a.AddressID
WHERE AddressType='Main Office'
EXCEPT
SELECT c.CompanyName 
FROM [SalesLT].[Customer] AS c
LEFT JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
LEFT JOIN [SalesLT].[Address] AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType='Shipping'
ORDER BY c.CompanyName;

***********************************************************

SELECT c.CompanyName
FROM [SalesLT].[Customer] AS c 
JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
JOIN [SalesLT].[Address] AS a 
ON ca.AddressID = a.AddressID
WHERE AddressType='Main Office'
INTERSECT
SELECT c.CompanyName 
FROM [SalesLT].[Customer] AS c
LEFT JOIN [SalesLT].[CustomerAddress] AS ca 
ON c.CustomerID = ca.CustomerID
LEFT JOIN [SalesLT].[Address] AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType='Shipping'
ORDER BY c.CompanyName;
