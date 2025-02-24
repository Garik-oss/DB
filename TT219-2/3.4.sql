SELECT *
FROM [dbo].[Customers]
WHERE rating_cust <= 60
AND city_cust <> 'Yerevan'