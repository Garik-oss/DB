use [TT219-2]
go

--4.1
select city_cust, MAX(rating_cust) MaxRating
from Customers
group by city_cust

--4.2
select YEAR(date_ord) [Year], AVG(sum_ord) [AVG sum]
from Orders
group by YEAR(date_ord)

--4.3
select lname_cust, rating_cust
from Customers
where city_cust = 'Yerevan'

--4.4
select *
from sellers
where name_sel like 'M%'

--4.5
select c.name_cust, c.rating_cust, o.sum_ord
from Customers c
join Orders o on o.id_cust = c.id_cust

--4.6
select s.id_sel, s.lname_sel, o.date_ord
from Sellers s
join Orders o on o.id_sel = s.id_sel
where s.city_sel = 'Yerevan' and Year(o.date_ord) < 2013

--4.7
select c.city_cust, AVG(c.Credit) [AVG credit]
from Customers c
group by c.city_cust
having count(*) > 2

--4.8
select goods_name, FORMAT(Price, 'C')[PriceFormatted]
from Goods
where goods_name like 'A%'
and quantity > 10

--4.9
select city_sel, power(sum(comis_sel), 2) [Square comis_sel]
from Sellers
group by city_sel

