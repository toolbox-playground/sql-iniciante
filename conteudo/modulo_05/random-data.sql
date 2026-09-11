INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel)
SELECT 
    t.id AS treinador_id,
    FLOOR(1 + (RANDOM() * 801))::INT AS pokedex_number,
    CASE 
        WHEN RANDOM() > 0.6 THEN CONCAT('Mon_', FLOOR(RANDOM() * 1000))
        ELSE NULL 
    END AS apelido,
    FLOOR(1 + (RANDOM() * 100))::INT AS nivel
FROM generate_series(1, 1003) AS t(id)
-- Generate 1 to 4 caught Pokémon for each trainer
CROSS JOIN LATERAL generate_series(1, FLOOR(1 + (RANDOM() * 4))::INT);
