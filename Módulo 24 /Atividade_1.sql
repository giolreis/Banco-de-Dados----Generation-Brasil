-- Criar banco de dados
CREATE DATABASE RH_Service;

-- Usar o banco de dados criado
USE RH_Service;

-- Criar tabela de colaboradores
CREATE TABLE Colaboradores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(100),
    Departamento VARCHAR(100),
    Salario DECIMAL(10, 2),
    Data_Contratacao DATE
);

-- Inserir dados na tabela de colaboradores
INSERT INTO Colaboradores (Nome, Cargo, Departamento, Salario, Data_Contratacao)
VALUES 
('João Silva', 'Analista de RH', 'Recursos Humanos', 2500.00, '2020-01-15'),
('Maria Santos', 'Gerente de Vendas', 'Vendas', 3000.00, '2018-05-20'),
('Pedro Oliveira', 'Desenvolvedor', 'Tecnologia', 3500.00, '2019-10-10'),
('Ana Costa', 'Assistente Administrativo', 'Administração', 1800.00, '2021-03-05'),
('Lucas Pereira', 'Analista Financeiro', 'Financeiro', 2200.00, '2017-12-12');

-- Selecionar todos os colaboradores com salário maior que 2000
SELECT * FROM Colaboradores WHERE Salario > 2000;

-- Selecionar todos os colaboradores com salário menor que 2000
SELECT * FROM Colaboradores WHERE Salario < 2000;

-- Atualizar o salário do colaborador com ID 4
UPDATE Colaboradores SET Salario = 2100.00 WHERE ID = 4;

