CREATE DATABASE UnionLab;
GO

USE UnionLab;
GO

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