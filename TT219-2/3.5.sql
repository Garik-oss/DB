SELECT *
FROM [dbo].[Orders]
WHERE
--A)
--datepart(year, date_ord) = 2012
--AND datepart(month, date_ord) = 10
--OR datepart(month, date_ord) = 12
--B)
YEAR(date_ord) = 2012
AND MONTH(date_ord) = 10
OR MONTH(date_ord) = 12