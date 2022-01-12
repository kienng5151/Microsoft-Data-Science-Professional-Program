
DECLARE @OrderID int = 0
DECLARE @error VARCHAR(30) = 'Order number' + CAST(@OrderID AS VARCHAR) + ' does not exist'

IF NOT EXISTS (SELECT * FROM [SalesLT].[SalesOrderHeader] WHERE SalesOrderID=@OrderID)
	BEGIN
		THROW 50001, @error, 0;
	END
ELSE
	BEGIN
		DELETE FROM [SalesLT].[SalesOrderDetail] WHERE SalesOrderID = @OrderID;
		DELETE FROM [SalesLT].[SalesOrderHeader] WHERE SalesOrderID = @OrderID;
	END

--NOTE:
-- The problem arises when the statements are executed individually instead of as a “unit”, and the semicolons seem to trigger that.
-- When remove the semicolons from the statement, it works

###########################

DECLARE @OrderID int = 71774
DECLARE @error VARCHAR(30) = 'Order number' + CAST(@OrderID AS VARCHAR) + ' does not exist'

BEGIN TRY
	IF NOT EXISTS (SELECT * FROM [SalesLT].[SalesOrderHeader] WHERE SalesOrderID=@OrderID)
		BEGIN
			THROW 50001, @error, 0;
		END
	ELSE
		BEGIN
			DELETE FROM [SalesLT].[SalesOrderDetail] WHERE SalesOrderID = @OrderID;
			DELETE FROM [SalesLT].[SalesOrderHeader] WHERE SalesOrderID = @OrderID;
		END
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH

***********************************************************

DECLARE @OrderID int = 0
DECLARE @error VARCHAR(30) = 'Order number' + CAST(@OrderID AS VARCHAR) + ' does not exist'

BEGIN TRY
	IF NOT EXISTS (SELECT * FROM [SalesLT].[SalesOrderHeader] WHERE SalesOrderID=@OrderID)
		BEGIN
			THROW 50001, @error, 0;
		END
	ELSE
		BEGIN
			BEGIN TRANSACTION
				DELETE FROM [SalesLT].[SalesOrderDetail] WHERE SalesOrderID = @OrderID;
				DELETE FROM [SalesLT].[SalesOrderHeader] WHERE SalesOrderID = @OrderID;
			COMMIT TRANSACTION
		END
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
	ELSE
		BEGIN
			PRINT ERROR_MESSAGE();
		END
END CATCH






