-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_construindo_vidas;

-- Utilização do banco de dados criado
USE db_construindo_vidas;

-- Criação da tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100),
    tipo VARCHAR(50)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao, tipo) VALUES
('Ferramentas', 'Produtos relacionados a ferramentas para construção', 'Ferragens'),
('Elétrica', 'Produtos elétricos para construção', 'Hidráulica'),
('Hidráulica', 'Produtos hidráulicos para construção', 'Hidráulica'),
('Tintas', 'Produtos relacionados a tintas e materiais de pintura', 'Acabamento'),
('Materiais de Construção', 'Materiais diversos para construção', 'Diversos');

-- Criação da tabela tb_produtos
CREATE TABLE IF NOT EXISTS tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10, 2),
    descricao TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserção de registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, descricao, id_categoria) VALUES
('Furadeira', 150.00, 'Furadeira de impacto 500W', 1),
('Chave de Fenda', 10.00, 'Chave de fenda com cabo emborrachado', 1),
('Fio Elétrico', 120.00, 'Rolo de fio elétrico 50 metros', 2),
('Torneira', 80.00, 'Torneira para pia de cozinha', 3),
('Tinta Acrílica', 90.00, 'Lata de tinta acrílica 3.6 litros', 4),
('Cimento', 30.00, 'Saco de cimento 50kg', 5),
('Tijolos', 150.00, 'Pacote com 100 tijolos cerâmicos', 5),
('Vassoura', 15.00, 'Vassoura de pelo para limpeza', 1);

-- SELECT para produtos com valor maior que R$ 100,00
SELECT * FROM tb_produtos WHERE preco > 100.00;

-- SELECT para produtos com valor entre R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

-- SELECT utilizando LIKE para produtos com "C" no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN para unir tb_produtos com tb_categorias
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- SELECT utilizando INNER JOIN para unir tb_produtos com tb_categorias para uma categoria específica
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Hidráulica';
