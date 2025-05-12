use NORTHWND;

--10.1
CREATE TRIGGER trg_PreventMissingShipCountry
ON Orders
AFTER INSERT
AS
BEGIN
	select * from inserted;
    IF EXISTS (SELECT 1 FROM inserted WHERE ShipCountry IS NULL OR ShipCountry = '')
    BEGIN
        ROLLBACK TRANSACTION;
    END;
END;

INSERT INTO [dbo].[Orders]
           ([CustomerID]
           ,[EmployeeID]
           ,[OrderDate]
           ,[RequiredDate]
           ,[ShippedDate]
           ,[ShipVia]
           ,[Freight]
           ,[ShipName]
           ,[ShipAddress]
           ,[ShipCity]
           ,[ShipRegion]
           ,[ShipPostalCode]
           ,[ShipCountry])
     VALUES(
           'ALFKI',
		   1,
           '2020-1-1',
           '2020-1-1',
           '2020-1-1',
           2,
           100,
           'Test',
           'Test',
           'Test',
           'T',
           'T',
           'A')
GO

--10.2
--DISABLE TRIGGER ALL ON Customers;

CREATE TRIGGER PreventPhoneUpdate
ON Customers
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Phone)
    BEGIN
        ROLLBACK TRANSACTION;
    END
END;

UPDATE [Customers]
   SET Phone = '11111'
   where CustomerID = 'ALFKI'

--10.3

USE NORTHWND;
GO

CREATE TRIGGER PreventChanges
ON DATABASE
FOR alter_table, drop_table
AS
BEGIN
    ROLLBACK TRANSACTION;    
END;
GO

--10.4
SELECT t.* FROM sys.triggers t ORDER BY t.name;

--10.5
DISABLE TRIGGER PreventPhoneUpdate ON Customers;

UPDATE [Customers]
   SET Phone = '11111'
   WHERE CustomerID = 'ALFKI';

ENABLE TRIGGER PreventPhoneUpdate ON Customers;

--10.6
DROP TRIGGER IF EXISTS trg_PreventMissingShipCountry;

