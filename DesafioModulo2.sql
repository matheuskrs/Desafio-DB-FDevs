/*Exercício 1*/
CREATE DATABASE Production;

USE Production;

CREATE TABLE ProductCategory (
	ProductCategoryId					INT IDENTITY,
	Name VARCHAR(100)					NOT NULL,
	CONSTRAINT PK_ProductCategory_Id	PRIMARY KEY(ProductCategoryId)
);

CREATE TABLE Product (	
	ProductId							INT IDENTITY,
	ProductCategoryId					INT NOT NULL,
	Name								VARCHAR(100) NOT NULL,
	DefaultCost							DECIMAL(6,2) NOT NULL,
	ListPrice							DECIMAL(6,2) NOT NULL,
	CONSTRAINT FK_ProductCategory_Id	FOREIGN KEY (ProductCategoryId) REFERENCES ProductCategory(ProductCategoryId) ON DELETE CASCADE,
	CONSTRAINT PK_Product_Id			PRIMARY KEY(ProductId)
);

CREATE TABLE ProductInventory (
	ProductInventoryId					INT IDENTITY,
	Quantity							INT NOT NULL,
	ProductId							INT NOT NULL,
	CONSTRAINT FK_Product_Id			FOREIGN KEY(ProductId) REFERENCES Product(ProductId) ON DELETE CASCADE,
	CONSTRAINT PK_ProductInventory_Id	PRIMARY KEY(ProductInventoryId)
);

CREATE TABLE Cliente (
    ClienteId       INT IDENTITY PRIMARY KEY,
    Titulo          VARCHAR(10),
    PrimeiroNome    VARCHAR(50) NOT NULL,
    MeioInicial     CHAR(1),
    Sobrenome       VARCHAR(50) NOT NULL
);

INSERT INTO ProductCategory (Name)
VALUES	('Eletrônicos'),
		('Roupas'), /* Ou Clothing, que foi o nome pedido no exercício, mas deixei em português.*/
		('Bebidas'),
		('Alimentos');

INSERT INTO Product (Name, ProductCategoryId, DefaultCost, ListPrice)
VALUES	('Smartphone', 1, 200, 400),
		('Mountain Bike Socks', 2, 8.99, 12.99),
		('Coca Cola', 3, 4, 7.99),
		('Amendoim Japonês Dori',4, 5, 9.99),
		('Nutella 350G',4, 8, 16.99),
		('Cup Noodles Galinha Caipira', 4, 2.99, 4.99),
		('Televisão Samsung', 1, 750, 1200);

INSERT INTO ProductInventory (ProductId, Quantity)
VALUES	(1, 50),
		(2, 200),
		(3, 100),
		(4, 150),
		(5, 80),
		(6, 120),
		(7, 30);

SELECT 
    p.Name AS Produto,
    pc.Name AS Categoria,
    pi.Quantity AS 'Quantidade em Estoque'
FROM 
    Product p
INNER JOIN 
    ProductCategory pc ON p.ProductCategoryId = pc.ProductCategoryId
INNER JOIN 
    ProductInventory pi ON p.ProductId = pi.ProductId;

/*Exercício 2*/
DELETE p 
FROM 
	Product p
INNER JOIN
	ProductCategory pc ON p.ProductCategoryId = pc.ProductCategoryId
WHERE
	pc.Name LIKE 'Roupas'; /* Lembrando que aqui é Clothing, deixei em português pra melhorar a visualização. */


/*Exercício 3*/
INSERT INTO Cliente (Titulo, PrimeiroNome, MeioInicial, Sobrenome)
VALUES	('Sr.', 'Matheus', 'K', 'Rodrigues'),
		('Sra.', 'Giovanna', NULL, 'Grigolato'),
		('Dr.', 'Lucas', 'R', 'Nascimento'),
		(NULL, 'Silvana', NULL, 'Rodrigues'),
		('Sr.', 'Adão', NULL, 'Souza');

SELECT
	CASE
		WHEN Titulo IS NOT NULL THEN
			Titulo + ' '
		ELSE
			'' 
		END +
		PrimeiroNome +
	CASE
		WHEN MeioInicial IS NOT NULL THEN
			' ' + MeioInicial + '.'
		ELSE
			''
		END +
		' ' + Sobrenome
		AS 'NomeCompleto'
FROM Cliente;