use NORTHWND
--8.2
CREATE PROCEDURE GetProds_TT219_2
AS
BEGIN
    SET NOCOUNT ON;

    select p.ProductName, p.UnitPrice
	from Products p
	where p.ProductName like 'Ch%'
	AND UnitPrice <= 20
END;

exec GetProds_TT219_2;

--8.3
CREATE PROCEDURE GetProdInfo_TT219_2
with encryption
AS
BEGIN
    SET NOCOUNT ON;

    select p.ProductName, p.UnitPrice, p.UnitsInStock, p.UnitsInStock * p.UnitPrice Sum
	from products p
END;

exec GetProdInfo_TT219_2

--8.4
CREATE PROCEDURE GetCustomersInYear_TT219_2
    @OrderYear INT
AS
BEGIN
    SET NOCOUNT ON;

    select c.ContactName, o.OrderDate
	from Customers c
	join Orders o ON o.CustomerID = c.CustomerID
	Where Year(OrderDate) = @OrderYear
END;

exec GetCustomersInYear_TT219_2 1997

--8.5
CREATE PROCEDURE GetContactTitle
    @CustomerID nchar(30),
    @ContactTitle NVARCHAR(100) OUTPUT
AS
BEGIN
    select @ContactTitle = c.ContactTitle 
	from Customers c
	where c.CustomerID = @CustomerID
END;

DECLARE @Title NVARCHAR(50);

EXEC GetContactTitle @CustomerID = 'ALFKI', @ContactTitle = @Title OUTPUT;

Select @Title;

--8.6
sp_helptext GetContactTitle;
sp_help GetContactTitle;
sp_stored_procedures;


