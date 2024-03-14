-- Criar banco de dados
CREATE DATABASE Ecommerce_DB;

-- Usar o banco de dados criado
USE Ecommerce_DB;

-- Criar tabela de produtos
CREATE TABLE Produtos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Categoria VARCHAR(100),
    Preco DECIMAL(10, 2),
    Estoque INT,
    Descrição TEXT
);

-- Inserir dados na tabela de produtos
INSERT INTO Produtos (Nome, Categoria, Preco, Estoque, Descrição)
VALUES 
('Camiseta Polo', 'Roupas', 39.99, 100, 'Camiseta polo em algodão'),
('Tênis Esportivo', 'Calçados', 199.99, 50, 'Tênis esportivo com tecnologia de amortecimento'),
('Notebook', 'Eletrônicos', 1299.99, 20, 'Notebook com processador Intel Core i5 e 8GB de RAM'),
('Smartphone', 'Eletrônicos', 799.99, 30, 'Smartphone com tela de 6 polegadas e câmera de 48MP'),
('Fone de Ouvido Bluetooth', 'Acessórios', 79.99, 80, 'Fone de ouvido sem fio com conectividade Bluetooth'),
('Mochila', 'Acessórios', 49.99, 120, 'Mochila resistente e confortável para uso diário'),
('Relógio de Pulso', 'Acessórios', 299.99, 40, 'Relógio de pulso analógico com pulseira de couro'),
('Câmera Digital', 'Eletrônicos', 699.99, 15, 'Câmera digital compacta com zoom óptico de 10x');

-- Selecionar todos os produtos com preço maior que 500
SELECT * FROM Produtos WHERE Preco > 500;

-- Selecionar todos os produtos com preço menor que 500
SELECT * FROM Produtos WHERE Preco < 500;

-- Atualizar o estoque do produto com ID 3
UPDATE Produtos SET Estoque = 25 WHERE ID = 3;
