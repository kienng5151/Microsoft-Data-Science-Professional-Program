
INSERT INTO [SalesLT].[Product] (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

SELECT SCOPE_IDENTITY();

SELECT * FROM [SalesLT].[Product]
WHERE ProductID = SCOPE_IDENTITY();

###########################

INSERT INTO [SalesLT].[ProductCategory] (ParentProductCategoryID, Name)
VALUES(4, 'Bells and Horns');

INSERT INTO [SalesLT].[Product] (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES('Bicycle Bell', 'BB-RING', 2.47, 4.99, IDENT_CURRENT('[SalesLT].[ProductCategory]'), GETDATE()),
('Bicycle Horn', 'BB-PARP', 1.29, 3.75, IDENT_CURRENT('[SalesLT].[ProductCategory]'), GETDATE());

SELECT p.Name AS Product, pcat.Name AS Category
FROM [SalesLT].[Product] AS p 
JOIN [SalesLT].[ProductCategory] AS pcat 
ON p.ProductCategoryID = pcat.ProductCategoryID
WHERE p.ProductCategoryID = IDENT_CURRENT('[SalesLT].[ProductCategory]');

***********************************************************

UPDATE [SalesLT].[Product]
SET ListPrice = ListPrice * 1.1
WHERE ProductCategoryID = 
	(SELECT ProductCategoryID FROM [SalesLT].[ProductCategory] 
	WHERE Name='Bells and Horns')

***********************************************************

UPDATE [SalesLT].[Product]
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37 AND ProductNumber <> 'LT-L123'

***********************************************************

DELETE FROM [SalesLT].[Product]
WHERE ProductCategoryID =	
	(SELECT ProductCategoryID FROM [SalesLT].[ProductCategory] WHERE Name='Bells and Horns');

DELETE FROM [SalesLT].[ProductCategory]
WHERE ProductCategoryID =	
	(SELECT ProductCategoryID FROM [SalesLT].[ProductCategory] WHERE Name='Bells and Horns');


