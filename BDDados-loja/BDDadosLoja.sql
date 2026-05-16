CREATE DATABASE loja;
USE loja;

CREATE TABLE categorias (
ID_Categoria INT,
Nome_Categoria VARCHAR(100),
PRIMARY KEY (ID_Categoria)
);

CREATE TABLE cliente (
ID_Cliente INT PRIMARY KEY,
Nome VARCHAR(100),
Cidade VARCHAR(100),
UF CHAR(2),
Data_Cadastro DATE
);

CREATE TABLE produtos (
ID_Produto INT PRIMARY KEY,
Descricao VARCHAR(100),
Preco_Unitario DECIMAL(10,2),
Estoque INT,
FK_Categoria INT
);

CREATE TABLE clientes (
ID_Cliente INT PRIMARY KEY,
Nome VARCHAR(100),
Cidade VARCHAR(100),
UF CHAR(2),
Data_Cadastro DATE
);

CREATE TABLE vendas(
ID_Venda INT PRIMARY KEY,
Fk_Cliente INT,
FK_Produto INT,
Quantidade INT,
Data_Venda DATE,
FOREIGN KEY (FK_Cliente) REFERENCES clientes(ID_Cliente),
FOREIGN KEY (FK_Produto) REFERENCES produtos(ID_Produto)
);

INSERT INTO categorias VALUES (1, 'Eletrônicos');
INSERT INTO categorias VALUES (2, 'Móveis');
INSERT INTO categorias VALUES (3, 'Informática');

INSERT INTO clientes VALUES (10, 'Ana Silva', 'São Paulo', 'SP', '2023-01-15');
INSERT INTO clientes VALUES (11, 'Bruno Souza', 'Curitiba', 'PR', '2023-05-20');
INSERT INTO clientes VALUES (12, 'Carla Dias', 'São Paulo', 'SP', '2024-02-10');
INSERT INTO clientes VALUES (13, 'Diego Lemos', 'Belo Horizonte', 'MG', '2024-03-01');


INSERT INTO vendas VALUES (1001, 10, 101, 1, '2024-03-10');
INSERT INTO vendas VALUES (1002, 11, 102, 2, '2024-03-12');
INSERT INTO vendas VALUES (1003, 10, 103, 5, '2024-03-15');
INSERT INTO vendas VALUES (1004, 12, 101, 1, '2024-03-20');
INSERT INTO vendas VALUES (1005, 13, 105, 1, '2024-03-22');
INSERT INTO vendas VALUES (1006, 10, 104, 1, '2024-03-25');

INSERT INTO produtos VALUES (101, 'Smartphone X', 2500.00, 50, 1);
INSERT INTO produtos VALUES (102, 'Cadeira Gamer', 1200.00, 15, 2);
INSERT INTO produtos VALUES (103, 'Mouse Sem Fio', 150.00, 100, 3);
INSERT INTO produtos VALUES (104, 'Monitor 4K', 3200.00, 10, 3);
INSERT INTO produtos VALUES (105, 'Mesa de Escritório', 850.00, 8, 2);

SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM categorias;

SELECT MAX(Preco_Unitario) FROM produtos WHERE FK_Categoria = 3;

SELECT MIN(Preco_Unitario) FROM produtos WHERE FK_Categoria = 2;

SELECT FK_Categoria, COUNT(*) FROM produtos GROUP BY FK_Categoria;

SELECT MAX(p.Preco_Unitario * v.Quantidade)
FROM vendas v
JOIN clientes c ON v.FK_Cliente = c.ID_Cliente
JOIN produtos p ON v.FK_Produto = p.ID_Produto
WHERE c.Cidade = 'São Paulo';

SELECT SUM(Quantidade) FROM vendas WHERE FK_Produto = 101;

SELECT MAX(p.Preco_Unitario * v.Quantidade)
FROM vendas v
JOIN produtos p ON v.FK_Produto = p.ID_Produto
WHERE v.Data_Venda BETWEEN '2024-03-15' AND '2024-03-25';