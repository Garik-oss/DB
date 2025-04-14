use [TT219-2]
go

--7.1
Select * from orders o
Where o.sum_ord in (select distinct Credit from Customers)

--7.2
Select c.* from Customers c
Where c.id_cust in (select distinct id_cust 
	  from Orders
      where sum_ord = 70000) 

--7.3
Select c.* from Customers c
Where c.id_cust in (select distinct id_cust from Orders)

Select c.* from Customers c
Where Exists (select distinct o.id_cust from Orders o where o.id_cust = c.id_cust)

--7.4
Select s.name_sel, s.plan_sel
from Sellers s
Where s.plan_sel > (Select AVG(s2.plan_sel) from Sellers s2)

Select s.name_sel, s.plan_sel, avgPlan.avgPlan from Sellers s
Join (select AVG(s.plan_sel) avgPlan from Sellers s) avgPlan
On avgPlan.avgPlan < s.plan_sel

--7.5
Select s.name_sel, s.city_sel, (Select COUNT(*) from Orders o where o.id_sel = s.id_sel) OrderCount from Sellers s
Where s.city_sel = 'Yerevan'

Select s.name_sel, s.city_sel, SellerOrderCount.OrderCount from Sellers s
Join (Select id_sel, COUNT(*) OrderCount from Orders group by id_sel) as SellerOrderCount
On SellerOrderCount.id_sel = s.id_sel
Where s.city_sel = 'Yerevan'
