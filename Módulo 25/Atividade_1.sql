-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_generation_game_online;

-- Utilização do banco de dados criado
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE IF NOT EXISTS tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100)
);

-- Inserção de registros na tabela tb_classes
INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Classe especializada em combate corpo a corpo'),
('Mago', 'Classe especializada em magias e feitiços'),
('Arqueiro', 'Classe especializada em ataques à distância'),
('Lutador', 'Classe especializada em técnicas de luta'),
('Cavaleiro', 'Classe especializada em montaria e defesa');

-- Criação da tabela tb_personagens
CREATE TABLE IF NOT EXISTS tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    nivel INT,
    poder_ataque INT,
    poder_defesa INT,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

-- Inserção de registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, id_classe) VALUES
('Herói', 10, 2500, 1800, 1),
('Feiticeira', 8, 1800, 1200, 2),
('Atirador', 12, 2200, 1500, 3),
('Mestre de Kung Fu', 15, 2800, 2000, 4),
('Cavaleiro Negro', 9, 2000, 1600, 5),
('Campeão', 11, 2400, 1900, 1),
('Conjurador', 7, 1700, 1100, 2),
('Caçador', 13, 2300, 1700, 3);

-- SELECT para personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT para personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE para encontrar personagens com "C" no nome
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN para unir tb_personagens com tb_classes
SELECT p.*, c.nome AS classe_nome, c.descricao AS classe_descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id;

-- SELECT utilizando INNER JOIN para unir tb_personagens com tb_classes para uma classe específica
SELECT p.*, c.nome AS classe_nome, c.descricao AS classe_descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id
WHERE c.nome = 'Arqueiro';
