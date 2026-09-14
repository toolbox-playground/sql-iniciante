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

