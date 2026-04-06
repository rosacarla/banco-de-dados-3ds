-- Remove tabela demo (exemplo inicial) do SQLite
DROP TABLE demo;

-- Ativar suporte a chaves estrangeiras
PRAGMA foreign_keys = ON;

-- Criação da tabela de Clientes
CREATE TABLE Clientes (
ClienteID INTEGER PRIMARY KEY,
Nome TEXT NOT NULL
);

-- Criação da tabela de Pedidos com FK
CREATE TABLE Pedidos (
PedidoID INTEGER PRIMARY KEY,
ClienteID INTEGER NOT NULL,
DataPedido TEXT,
FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID)
);

-- Inserção de dados em Clientes
INSERT INTO Clientes (Nome) VALUES ('Ana');
INSERT INTO Clientes (Nome) VALUES ('Bruno');

-- Inserção de dados em Pedidos
INSERT INTO Pedidos (ClienteID, DataPedido) VALUES (1, '2026-04-06');
INSERT INTO Pedidos (ClienteID, DataPedido) VALUES (2, '2026-04-07');

-- Consulta inicial: juntar Clientes e Pedidos
SELECT p.PedidoID, c.Nome, p.DataPedido
FROM Pedidos p
JOIN Clientes c ON p.ClienteID = c.ClienteID;
