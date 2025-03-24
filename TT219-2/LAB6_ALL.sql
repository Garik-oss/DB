USE [TT219-2]
GO

--6.1
SELECT S.id_sel, S.name_sel, S.city_sel, SUM(O.sum_ord) SUM_ORD FROM Sellers S
JOIN Orders O ON O.id_sel = S.id_sel
GROUP BY S.id_sel, S.name_sel, S.city_sel
HAVING SUM(SUM_ORD) <= 55000

--6.2
SELECT S.lname_sel, S.leader, O.sum_ord
FROM Sellers S
JOIN Orders O ON O.id_sel = S.id_sel

--6.3
SELECT C.lname_cust, C.city_cust, AVG(O.sum_ord) AVG_ORD
FROM Customers C
JOIN Orders O ON O.id_cust = C.id_cust
WHERE YEAR(O.date_ord) = 2012
GROUP BY C.id_cust, C.lname_cust, C.city_cust

--6.4
SELECT * FROM Customers C
LEFT JOIN Goods G ON G.id_cust = C.id_cust

SELECT * FROM Customers C
RIGHT JOIN Goods G ON G.id_cust = C.id_cust

--6.5
SELECT DATEDIFF(MONTH, O.date_ord, GETDATE()) MONTH_DIFF, *
FROM Orders O
WHERE DATEDIFF(MONTH, O.date_ord, GETDATE()) < 3

--6.6
SELECT TOP 1 *
FROM
	(SELECT C.id_cust, C.name_cust, COUNT(O.id_ord) ORDER_COUNT, AVG(O.sum_ord) AS AVG_SUM
	FROM Customers C
	JOIN Orders O ON O.id_cust = C.id_cust
	GROUP BY C.id_cust, C.name_cust
	) AS GROUPED_CUST
ORDER BY ORDER_COUNT DESC

--6.7
SELECT C.id_cust, C.name_cust, G.id_goods, G.goods_name, G.Price, AVG(O.sum_ord) AVG_SUM_ORD
FROM Goods G
JOIN Customers C ON G.id_cust = C.id_cust
JOIN Orders O ON O.id_cust = C.id_cust
GROUP BY C.id_cust, C.name_cust, G.id_goods, G.goods_name, G.Price
HAVING G.Price > AVG(O.sum_ord)