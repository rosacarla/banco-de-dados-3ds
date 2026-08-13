USE Northwind;

-- 1. Desativa o Modo de Atualização Segura e a checagem de chaves estrangeiras
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;

-- 2. Limpa os dados de forma forçada e reseta o contador de ID
DELETE FROM CategoryProducts;
ALTER TABLE CategoryProducts AUTO_INCREMENT = 1;

-- 3. Inicia a transação e insere os dados limpos
START TRANSACTION; 

INSERT INTO CategoryProducts (CategoryID, CategoryName, Description) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
(6, 'Meat/Poultry', 'Prepared meats'),
(7, 'Produce', 'Dried fruit and bean curd'),
(8, 'Seafood', 'Seaweed and fish');

COMMIT;

-- 4. Reativa as travas de segurança do MySQL
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;

-- Visualiza o resultado final
SELECT * FROM CategoryProducts;
