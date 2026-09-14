CREATE TABLE treinador_meunome (
    id_treinador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade_natal VARCHAR(100),
    data_inicio DATE,
    nivel INT DEFAULT 1,
    pokemon_principal_id INT,
    CONSTRAINT fk_treinador_pokemon 
        FOREIGN KEY (pokemon_principal_id) 
        REFERENCES pokemon(pokedex_number)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

/*
id_treinador INT AUTO_INCREMENT PRIMARY KEY: Identificador único para cada treinador.
nome VARCHAR(100) NOT NULL: Nome do treinador (texto até 100 caracteres).
cidade_natal VARCHAR(100): Cidade de origem do treinador.
data_inicio DATE: Data em que o treinador iniciou sua jornada (formato YYYY-MM-DD).
nivel INT DEFAULT 1: Nível ou experiência do treinador.
pokemon_principal_id INT: Campo de relacionamento com o tipo de dado INT, exatamente o mesmo utilizado para o pokedex_number na tabela pokemon.
CONSTRAINT fk_treinador_pokemon FOREIGN KEY...: Define a chave estrangeira garantindo a integridade referencial com a tabela pokemon.
*/

ALTER TABLE treinador_meunome
    ADD vitorias INT DEFAULT 0,
    ADD local_capturado VARCHAR(100);

-- ADD vitorias INT DEFAULT 0: Cria uma coluna de número inteiro para contabilizar as vitórias (com valor padrão inicial de 0).
-- ADD local_capturado VARCHAR(100): Cria uma coluna do tipo texto de até 100 caracteres para registrar a localização onde o Pokémon foi capturado.

ALTER TABLE treinador_meunome ADD COLUMN `teste` VARCHAR(45) NULL AFTER `pokemon_principal_id`;
ALTER TABLE treinador_thiago ADD COLUMN `teste` VARCHAR(45) NULL AFTER `pokemon_id`;
ALTER TABLE treinador_meunome ADD COLUMN `pokemon` VARCHAR(45) NULL AFTER `pokemon_principal_id`;
ALTER TABLE treinador_meunome ADD INDEX `TESTE` (`pokemon` ASC), ADD UNIQUE INDEX (`pokemon`);
ALTER TABLE treinador_meunome MODIFY id_treinador TINYINT NOT NULL, CHANGE teste b CHAR(20);
ALTER TABLE treinador_meunome DROP COLUMN `b`;

