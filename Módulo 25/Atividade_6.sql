-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;

-- Utilização do banco de dados criado
USE db_curso_da_minha_vida;

-- Criação da tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100),
    area VARCHAR(50)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao, area) VALUES
('Desenvolvimento Web', 'Cursos relacionados a desenvolvimento para web', 'Tecnologia'),
('Data Science', 'Cursos relacionados a ciência de dados e análise estatística', 'Tecnologia'),
('Marketing Digital', 'Cursos relacionados a estratégias de marketing online', 'Negócios'),
('Gestão de Projetos', 'Cursos relacionados a técnicas de gestão de projetos', 'Negócios'),
('Design Gráfico', 'Cursos relacionados a design gráfico e editoração', 'Criatividade');

-- Criação da tabela tb_cursos
CREATE TABLE IF NOT EXISTS tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    carga_horaria INT,
    nivel VARCHAR(50),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserção de registros na tabela tb_cursos
INSERT INTO tb_cursos (nome, preco, carga_horaria, nivel, id_categoria) VALUES
('Curso de HTML5 e CSS3', 700.00, 40, 'Intermediário', 1),
('Curso de Python para Data Science', 900.00, 60, 'Avançado', 2),
('Curso de Marketing de Conteúdo', 600.00, 30, 'Básico', 3),
('Curso de Gestão Ágil de Projetos', 800.00, 50, 'Intermediário', 4),
('Curso de Adobe Illustrator', 1000.00, 45, 'Avançado', 5),
('Curso de JavaScript Avançado', 750.00, 50, 'Avançado', 1),
('Curso de Análise de Dados com R', 850.00, 60, 'Intermediário', 2),
('Curso de SEO e SEM', 650.00, 35, 'Intermediário', 3);

-- SELECT para cursos com valor maior que R$ 500,00
SELECT * FROM tb_cursos WHERE preco > 500.00;

-- SELECT para cursos com valor entre R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

-- SELECT utilizando LIKE para cursos com "J" no nome
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

-- SELECT utilizando INNER JOIN para unir tb_cursos com tb_categorias
SELECT c.*, cat.nome AS categoria_nome, cat.descricao AS categoria_descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id;

-- SELECT utilizando INNER JOIN para unir tb_cursos com tb_categorias para uma categoria específica
SELECT c.*, cat.nome AS categoria_nome, cat.descricao AS categoria_descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id
WHERE cat.nome = 'Java';
