-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;

-- Utilização do banco de dados criado
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Salgadas', 'Pizzas com recheios salgados'),
('Doces', 'Pizzas com recheios doces'),
('Vegetarianas', 'Pizzas com apenas ingredientes vegetarianos');

-- Criação da tabela tb_pizzas
CREATE TABLE IF NOT EXISTS tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10, 2),
    ingredientes TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserção de registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, preco, ingredientes, id_categoria) VALUES
('Margarita', 40.00, 'Molho de tomate, queijo, manjericão', 1),
('Pepperoni', 45.00, 'Molho de tomate, queijo, pepperoni', 1),
('Calabresa', 50.00, 'Molho de tomate, queijo, calabresa', 1),
('Brigadeiro', 35.00, 'Chocolate, leite condensado, granulado', 2),
('Banana com Canela', 40.00, 'Banana, canela, leite condensado', 2),
('Vegetariana', 55.00, 'Molho de tomate, queijo, tomate, cebola, pimentão', 3),
('Quatro Queijos', 60.00, 'Molho de tomate, queijo mussarela, queijo provolone, queijo gorgonzola, queijo parmesão', 1),
('Portuguesa', 48.00, 'Molho de tomate, queijo, presunto, ovos, cebola, azeitonas', 1);

-- SELECT para pizzas com valor maior que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- SELECT para pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- SELECT utilizando LIKE para pizzas com "M" no nome
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- SELECT utilizando INNER JOIN para unir tb_pizzas com tb_categorias
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- SELECT utilizando INNER JOIN para unir tb_pizzas com tb_categorias para uma categoria específica
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Doces';
