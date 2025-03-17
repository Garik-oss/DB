use [TT219-2]
go

--5.1
INSERT INTO [Customers]
           ([lname_cust]
           ,[city_cust]
           ,[rating_cust]
           ,[Credit])
     VALUES
           ('Poghosyan', 'Yerevan', 7 , 1500),
		   ('Nalbandyan', 'Yerevan', 2, 1000)

--5.2
INSERT INTO [Goods]
           ([goods_name]
           ,[quantity]
		   ,[id_cust])
     VALUES
           ('Orange', 5, 1)

--5.3
SELECT [id_sel]
      ,[name_sel]
      ,[lname_sel]
      ,[city_sel]
      ,[comis_sel]
      ,[leader]
      ,[plan_sel]
  INTO Yerevan_Sellers
  FROM [Sellers]
  WHERE city_sel = 'Yerevan'

--5.4
Truncate table Yerevan_sellers

--5.5
Delete from Customers
where rating_cust < 50

--5.6
Update Customers
set Credit = Credit + (Credit / 10)

--5.7
Update Orders
set sum_ord = 0
where year(date_ord) = 2012

--5.8
Select *
from Orders
where date_ord >= DATEADD(MONTH, -3, GETDATE())