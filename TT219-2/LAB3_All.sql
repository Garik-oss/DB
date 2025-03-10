use [TT219-2]

--3.1
Select id_ord, sum_ord, date_ord
From Orders

--3.2
Select *
From Customers
Where id_cust = 8

--3.3
select distinct id_sel
from Orders

--3.4
SELECT *
FROM [Customers]
WHERE rating_cust <= 60
AND city_cust <> 'Yerevan'

--3.5
SELECT *
FROM [Orders]
WHERE
--A)
--datepart(year, date_ord) = 2012
--AND datepart(month, date_ord) = 10
--OR datepart(month, date_ord) = 12
--B)
YEAR(date_ord) = 2012
AND MONTH(date_ord) = 10
OR MONTH(date_ord) = 12

--3.6
SELECT id_cust,
lname_cust,
rating_cust
FROM [Customers]
ORDER BY rating_cust DESC

--3.7
Select name_sel, upper(lname_sel) UpperLName, ROUND(comis_sel, 0) RoundedComis from Sellers
Where comis_sel is not null 
And plan_sel is not null

--3.8
Select ABS(plan_sel - comis_sel) Absolute
From Sellers

--3.9
Select Goods.*, Price - ((0.1 + (RAND()/10)) * Price) as NewPrice
From Goods 

--3.10
Select *, SQRT(Credit) as sqrt_credit
From Customers
Order by Credit asc

--3.11
SELECT id_cust, MAX(date_ord) lastDay, DATEDIFF(DAY, MAX(date_ord), GETDATE()) [FROM NOW]
FROM [Orders]
GROUP BY id_cust