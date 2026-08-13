-- Garante o uso do banco correto
USE Northwind;

-- Inicia transação no padrão MySQL
START TRANSACTION; 

-- Insere dados na tabela CategoryProducts especificando as colunas
INSERT INTO CategoryProducts (CategoryID, CategoryName, Description) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
(6, 'Meat/Poultry', 'Prepared meats'),
(7, 'Produce', 'Dried fruit and bean curd'),
(8, 'Seafood', 'Seaweed and fish');

-- Encerra a transação e salva os dados com segurança
COMMIT;

-- Consulta tabela CategoryProducts
SELECT * FROM CategoryProducts;
