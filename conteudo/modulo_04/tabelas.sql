-- Garante uso do banco de dados
USE pokemon_db;

-- Criação da tabela de Treinadores
CREATE TABLE IF NOT EXISTS treinadores (
    treinador_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade_natal VARCHAR(100),
    data_inicio DATE,
    insignias TINYINT UNSIGNED DEFAULT 0
);

CREATE TABLE IF NOT EXISTS treinador_pokemons (
    captura_id INT AUTO_INCREMENT PRIMARY KEY,
    treinador_id INT NOT NULL,
    pokedex_number INT NOT NULL,
    apelido VARCHAR(50),
    nivel INT NOT NULL DEFAULT 1,
    data_captura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Chaves Estrangeiras (Relacionamentos)
    CONSTRAINT fk_treinador FOREIGN KEY (treinador_id) REFERENCES treinadores(treinador_id) ON DELETE CASCADE,
    CONSTRAINT fk_pokemon FOREIGN KEY (pokedex_number) REFERENCES pokemon(pokedex_number) ON DELETE RESTRICT
);

-- Inserindo Treinadores
INSERT INTO treinadores (nome, cidade_natal, data_inicio, insignias) 
VALUES 
    ('Ash Ketchum', 'Pallet Town', '2023-01-10', 8),
    ('Misty Waterflower', 'Cerulean City', '2023-02-15', 5),
    ('Brock Slate', 'Pewter City', '2023-01-20', 6);

-- Inserindo Pokémons Capturados pelos Treinadores
-- Assumindo pokedex_number válidos da sua tabela principal (ex: 1 = Bulbasaur, 4 = Charmander, 7 = Squirtle, 25 = Pikachu)
INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES 
    (1, 25, 'Pika', 50),     -- Pikachu do Ash
    (1, 4, 'Charry', 36),     -- Charmander do Ash
    (2, 7, 'Bubbles', 25),    -- Squirtle da Misty
    (3, 1, 'Bulby', 20);      -- Bulbasaur do Brock

-- Adicionar nova coluna na tabela de treinadores
ALTER TABLE treinadores 
ADD COLUMN telefone VARCHAR(20) AFTER cidade_natal;

-- Modificar tamanho de coluna existente na tabela treinador_pokemons
ALTER TABLE treinador_pokemons 
MODIFY COLUMN apelido VARCHAR(100);

-- 1. Criação da tabela temporária de testes
CREATE TABLE IF NOT EXISTS treinadores_teste (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    status_teste VARCHAR(50)
);

-- 2. Inserção rápida apenas para validação
INSERT INTO treinadores_teste (nome, status_teste) 
VALUES ('Treinador Teste 1', 'Pendente');

-- 3. Exclusão definitiva da tabela teste
DROP TABLE IF EXISTS treinadores_teste;
