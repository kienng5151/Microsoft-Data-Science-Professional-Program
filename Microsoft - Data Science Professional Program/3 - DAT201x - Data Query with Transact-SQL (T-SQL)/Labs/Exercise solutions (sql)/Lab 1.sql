
SELECT * FROM [SalesLT].[Customer];

##########

SELECT Title, FirstName, MiddleName, LastName, Suffix 
FROM [SalesLT].[Customer];

******************************************************************

SELECT SalesPerson, Title + ' ' + LastName AS CustomerName, Phone FROM [SalesLT].[Customer];

*****************************************************************

SELECT CAST(CustomerID AS VARCHAR) + ': ' + CompanyName AS CustomerCompany 
FROM [SalesLT].[Customer];

****************************************************************

SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ') ' AS OrderRevision, 
CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate 
FROM [SalesLT].[SalesOrderHeader]; 

****************************************************************

SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', ' ') + ' ' + LastName AS CustomerNames 
FROM [SalesLT].[Customer];

****************************************************************

UPDATE [SalesLT].[Customer] 
SET EmailAddress=NULL 
WHERE CustomerID % 7=1;

SELECT CustomerID, COALESCE(EmailAddress, Phone) as PrimaryContact 
FROM [SalesLT].[Customer];

****************************************************************

UPDATE SalesLT.SalesOrderHeader 
SET ShipDate = NULL 
WHERE SalesOrderID > 71899;

SELECT SalesOrderID, OrderDate, 
	CASE 
		WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
		ELSE 'Shipped'
	END AS ShippingStatus 
FROM [SalesLT].[SalesOrderHeader];
