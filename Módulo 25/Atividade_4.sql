-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_cidade_das_carnes;

-- Utilização do banco de dados criado
USE db_cidade_das_carnes;

-- Criação da tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100),
    tipo VARCHAR(20)
);

-- Inserção de registros na tabela tb_categorias para um açougue
INSERT INTO tb_categorias (nome, descricao, tipo) VALUES
('Carnes Bovinas', 'Cortes de carne de boi', 'Carnes'),
('Carnes Suínas', 'Cortes de carne de porco', 'Carnes'),
('Aves', 'Cortes de carne de frango e outras aves', 'Carnes'),
('Peixes', 'Diversos tipos de peixes frescos e congelados', 'Carnes'),
('Outros', 'Outros produtos relacionados ao açougue', 'Outros');

-- Criação da tabela tb_produtos
CREATE TABLE IF NOT EXISTS tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10, 2),
    descricao TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserção de registros na tabela tb_produtos para um açougue
INSERT INTO tb_produtos (nome, preco, descricao, id_categoria) VALUES
('Picanha', 70.00, 'Corte nobre de carne bovina', 1),
('Costela de Porco', 55.00, 'Costela de porco suculenta', 2),
('Peito de Frango', 30.00, 'Peito de frango desossado', 3),
('Salmão', 90.00, 'Filé de salmão fresco', 4),
('Linguiça Toscana', 40.00, 'Linguiça artesanal temperada', 5),
('Filé Mignon', 120.00, 'Corte nobre de carne bovina', 1),
('Lombo Suíno', 65.00, 'Lombo suíno temperado', 2),
('Coxa de Frango', 25.00, 'Coxa de frango para assar', 3);

-- SELECT para produtos com valor maior que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT para produtos com valor entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

-- SELECT utilizando LIKE para produtos com "C" no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN para unir tb_produtos com tb_categorias
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- SELECT utilizando INNER JOIN para unir tb_produtos com tb_categorias para uma categoria específica (aves ou frutas)
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.tipo = 'Carnes' AND (c.nome = 'Aves' OR c.nome = 'Peixes');
