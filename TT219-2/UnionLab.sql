CREATE DATABASE UnionLab;
GO

USE UnionLab;
GO

--9.3
CREATE TABLE Products (
 prod_id INT IDENTITY(1,1) PRIMARY KEY,
 name nvarchar(50) ,
 price int,
 description nvarchar(50)
)

CREATE TABLE Sells_2015 (
 id_sel int IDENTITY(1,1) PRIMARY KEY,
 prod_id int NOT NULL ,
 count int ,
 sel_date date,
 FOREIGN KEY (prod_id) REFERENCES Products(prod_id)
)

SELECT * INTO Sells_2016 FROM Sells_2015 

SELECT * INTO Sells_2017 FROM Sells_2015

--9.4
INSERT INTO Products (name, price, description) VALUES 
 ('Notebook Asser 15.6" intel core i5', 500, 'ddr 500'),
 ('Notebook Asser 13.3" intel core i5', 600, 'ssd 125'),
 ('Notebook Asser 13.3" intel core i7', 750, 'ssd 250'),
 ('Notebook HP 13.3" intel core i7', 800, 'ssd 250'),
 ('Notebook HP 15.6" intel core i7', 600, 'ddr 1 trb'),
 ('Mouse laser', 10, 'Geniuse'),
 ('Mouse bluetooth', 15, 'HP'),
 ('Mouse pen', 20, '8X6');

INSERT INTO Sells_2015 (prod_id,count,sel_date) VALUES
 (1,1,'2015-04-01'),
 (3,1,'2015-08-25'),
 (6,5,'2015-10-10'),
 (2,1,'2015-10-25'),
 (7,3,'2015-12-23');

INSERT INTO Sells_2016 (prod_id,count,sel_date) VALUES
 (2,1,'2016-02-12'),
 (3,2,'2016-02-26'),
 (4,1,'2016-04-12'),
 (5,2,'2016-06-20'),
 (8,4,'2016-09-23');

INSERT INTO Sells_2017 (prod_id,count,sel_date) VALUES
 (1,1,'2017-04-02'),
 (4,1,'2017-05-14'),
 (5,1,'2017-07-02'),
 (7,5,'2017-09-30');

--9.5
SELECT s.id_sel, p.name, [count]
FROM Sells_2015 s
join Products p on p.prod_id = s.prod_id
UNION
SELECT id_sel, p.name, count
FROM Sells_2016 s
join Products p on p.prod_id = s.prod_id
UNION
SELECT id_sel, p.name, count
FROM Sells_2017 s
join Products p on p.prod_id = s.prod_id
order by count asc

SELECT s.id_sel, p.name, [count]
FROM Sells_2015 s
join Products p on p.prod_id = s.prod_id
UNION ALL
SELECT id_sel, p.name, count
FROM Sells_2016 s
join Products p on p.prod_id = s.prod_id
UNION ALL
SELECT id_sel, p.name, count
FROM Sells_2017 s
join Products p on p.prod_id = s.prod_id
order by count asc

--9.6
SELECT p.name, count, s.sel_date
FROM Sells_2016 s
join Products p on p.prod_id = s.prod_id
UNION
SELECT p.name, count, s.sel_date
FROM Sells_2017 s
join Products p on p.prod_id = s.prod_id
order by s.sel_date desc

SELECT p.name, count, s.sel_date
FROM Sells_2016 s
join Products p on p.prod_id = s.prod_id
UNION ALL
SELECT p.name, count, s.sel_date
FROM Sells_2017 s
join Products p on p.prod_id = s.prod_id
order by s.sel_date desc

--9.7
select 2015 as year, MAX(count) as MaxSellCount
from Sells_2015
Union 
select 2016 as year, MAX(count) as MaxSellCount
from Sells_2016
Union
select 2017 as year, MAX(count) as MaxSellCount
from Sells_2017

--9.8
SELECT p.prod_id, p.name
FROM Sells_2015 s
join Products p on p.prod_id = s.prod_id
except
SELECT p.prod_id, p.name
FROM Sells_2016 s
join Products p on p.prod_id = s.prod_id

--9.9
SELECT p.prod_id, p.name
FROM Sells_2015 s
join Products p on p.prod_id = s.prod_id
intersect
SELECT p.prod_id, p.name
FROM Sells_2016 s
join Products p on p.prod_id = s.prod_id
intersect
SELECT p.prod_id, p.name
FROM Sells_2017 s
join Products p on p.prod_id = s.prod_id

--9.11
Select * into Total_Sells
from Sells_2015
where 1 = 0

insert into Total_Sells
Select prod_id, count, sel_date from Sells_2015
Union
Select prod_id, count, sel_date from Sells_2016
Union
Select prod_id, count, sel_date from Sells_2017

select * from Total_Sells
order by sel_date

SELECT pt.prod_id, pt.name, [2014], [2015], [2016], [2017], [2018]
FROM
(
    SELECT p.prod_id, p.name, Year(t.sel_date) as year, count
    FROM Total_Sells t
	Join Products p on p.prod_id = t.prod_id
) AS s
PIVOT
(
    SUM(count)  -- or COUNT, AVG, etc.
    FOR year IN ([2014], [2015], [2016], [2017], [2018])
) AS pt;

Select prod_id, count, sel_date from Sells_2015
Union
Select prod_id, count, sel_date from Sells_2016
Union
Select prod_id, count, sel_date from Sells_2017
order by prod_id
