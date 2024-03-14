-- Criar banco de dados
CREATE DATABASE Escola_DB;

-- Usar o banco de dados criado
USE Escola_DB;

-- Criar tabela de estudantes
CREATE TABLE Estudantes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Idade INT,
    Serie VARCHAR(20),
    Nota DECIMAL(4, 2),
    Genero ENUM('Masculino', 'Feminino', 'Outro')
);

-- Inserir dados na tabela de estudantes
INSERT INTO Estudantes (Nome, Idade, Serie, Nota, Genero)
VALUES 
('João Silva', 15, '9º ano', 8.5, 'Masculino'),
('Maria Santos', 14, '8º ano', 7.2, 'Feminino'),
('Pedro Oliveira', 16, '1º ano', 6.9, 'Masculino'),
('Ana Costa', 15, '9º ano', 9.0, 'Feminino'),
('Lucas Pereira', 14, '8º ano', 8.8, 'Masculino'),
('Juliana Lima', 15, '9º ano', 6.5, 'Feminino'),
('Marcos Souza', 16, '1º ano', 7.8, 'Masculino'),
('Carla Oliveira', 14, '8º ano', 8.2, 'Feminino');

-- Selecionar todos os estudantes com nota maior que 7.0
SELECT * FROM Estudantes WHERE Nota > 7.0;

-- Selecionar todos os estudantes com nota menor que 7.0
SELECT * FROM Estudantes WHERE Nota < 7.0;

-- Atualizar a série do estudante com ID 3
UPDATE Estudantes SET Serie = '2º ano' WHERE ID = 3;

