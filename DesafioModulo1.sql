CREATE DATABASE Production;

USE Production;

CREATE TABLE Product (
	ProductId					INT IDENTITY,
	Name						VARCHAR(100) NOT NULL,
	DefaultCost					DECIMAL(6,2) NOT NULL,
	ListPrice					DECIMAL(6,2) NOT NULL,
	CONSTRAINT PK_Product_Id	PRIMARY KEY(ProductId)
);

INSERT INTO Product (Name, DefaultCost, ListPrice) 
VALUES('Smartphone', 200, 400),
	  ('Mountain Bike Socks', 8.99, 12.99),
	  /*Insert de produtos exemplo para mostrar melhor o ORDER BY lá em baixo*/
	  ('Coca Cola', 4, 7.99),
	  ('Amendoim Japonês Dori', 5, 9.99),
	  ('Nutella 350G', 8, 16.99),
	  ('Cup Noodles Galinha Caipira', 2.99, 4.99),
	  ('Televisão Samsung', 750, 1200);

 UPDATE Product
 SET ListPrice = 15
 WHERE Name LIKE 'Mountain Bike Socks';

 SELECT TOP 5 Name, ListPrice FROM Product
 ORDER BY ListPrice DESC;
