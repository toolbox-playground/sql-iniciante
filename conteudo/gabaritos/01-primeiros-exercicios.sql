-- 1.1 Alias e Distinct
SELECT DISTINCT classfication AS categoria_pokemon 
FROM pokemon;

-- 1.2 Alias em Colunas
SELECT 
    name AS Nome, 
    attack AS Ataque_Fisico, 
    sp_attack AS Ataque_Especial 
FROM pokemon;

-- 2.1 Predicado IS NULL
SELECT name, type1, weight_kg 
FROM pokemon 
WHERE type2 IS NULL;

-- 2.2 Predicados IN e BETWEEN
SELECT name, generation, speed 
FROM pokemon 
WHERE generation IN (1, 2) 
  AND speed BETWEEN 80 AND 110;

-- 2.3 Predicado LIKE
SELECT name, classfication 
FROM pokemon 
WHERE classfication LIKE '%Seed%' 
   OR classfication LIKE '%Turtle%';

-- 3.1 ORDER BY com LIMIT
SELECT name, base_total 
FROM pokemon 
ORDER BY base_total DESC, name ASC 
LIMIT 10;

-- 4.1 Manipulação de Strings (CONCAT, UPPER, LPAD)
SELECT 
    CONCAT('Nº #', LPAD(pokedex_number, 3, '0'), ' - ', UPPER(name), ' (', classfication, ')') AS apresentacao
FROM pokemon;

-- 5.1 Agregação por Tipo
SELECT 
    COUNT(*) AS total_pokemons,
    ROUND(AVG(hp), 2) AS media_hp,
    MAX(attack) AS maior_ataque,
    MIN(defense) AS menor_defesa
FROM pokemon
WHERE type1 = 'fire';

-- 5.2 Agregação com GROUP BY e HAVING
SELECT 
    generation, 
    ROUND(AVG(base_total), 2) AS media_forca
FROM pokemon
GROUP BY generation
HAVING AVG(base_total) > 400
ORDER BY generation;

-- 6.1 Tendência de Fraqueza
SELECT name, type1, type2, against_fire 
FROM pokemon 
WHERE against_fire >= 2
ORDER BY against_fire DESC;

-- 6.2 Média de Vulnerabilidade por Tipo
SELECT 
    type1, 
    ROUND(AVG(against_water), 2) AS media_vulnerabilidade_agua,
    ROUND(AVG(against_grass), 2) AS media_vulnerabilidade_planta
FROM pokemon
GROUP BY type1
ORDER BY media_vulnerabilidade_agua DESC;
