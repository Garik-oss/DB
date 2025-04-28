Use NORTHWND
go

--9.1
Create view EmployeeNamesTT219_2 (FirstName, LastName)
as
Select e.FirstName, e.LastName  from Employees e
;

Select * from EmployeeNamesTT219_2

--9.2
Create view MaxFrightOrdersTT219_2
With encryption
as
Select o.* From Orders o 
Join
(Select EmployeeID, MAX(Freight) employeeMaxFreight from Orders
group by EmployeeID) as sorted
On sorted.EmployeeID = o.EmployeeID AND o.Freight = sorted.employeeMaxFreight

select * from MaxFrightOrdersTT219_2
;

--9.3
Create view ReortedToFullerTT219_2
as
Select e.EmployeeID, e.LastName from Employees e
Where ReportsTo = (Select distinct f.EmployeeID from Employees f where f.LastName = 'Fuller')

Select * from ReortedToFullerTT219_2

--9.4
Create view ReortedToFullerTT219_2
as
Select e.EmployeeID, e.LastName from Employees e
Where ReportsTo = (Select distinct f.EmployeeID from Employees f where f.LastName = 'Fuller')

Select * from ReortedToFullerTT219_2

Select od.OrderID, od.Discount, s.CompanyName, p.ProductName
from Suppliers s
Join Products p ON p.SupplierID = s.SupplierID
Join [Order Details] od ON od.ProductID = p.ProductID AND od.Discount > 0