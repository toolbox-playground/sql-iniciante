-- 1. WHERE com AND
SELECT name, type1, type2 
FROM pokemon 
WHERE type1 = 'grass' 
  AND type2 = 'poison';

-- 2. WHERE com OR
SELECT name, attack, defense 
FROM pokemon 
WHERE attack > 100 
   OR defense > 100;

-- 3. Combinação de AND com OR (com parênteses para precedência)
SELECT name, generation, type1 
FROM pokemon 
WHERE generation = 1 
  AND (type1 = 'fire' OR type1 = 'water');

-- 4. Predicado BETWEEN combinado com AND
SELECT name, generation, weight_kg 
FROM pokemon 
WHERE weight_kg BETWEEN 10 AND 50 
  AND generation = 1;

-- 5. Predicado IN e operador AND
SELECT name, type1, is_legendary 
FROM pokemon 
WHERE type1 IN ('bug', 'poison', 'normal') 
  AND is_legendary = 0;

-- 6. Predicado IS NULL combinado com AND
SELECT name, type1, speed 
FROM pokemon 
WHERE type2 IS NULL 
  AND speed > 80;

-- 7. Predicado LIKE com OR e AND
SELECT name, classfication 
FROM pokemon 
WHERE classfication LIKE '%Pokémon' 
  AND (classfication LIKE '%Tiny%' OR classfication LIKE '%Mouse%');

-- 8. Atributos numéricos com AND
SELECT name, base_total, height_m 
FROM pokemon 
WHERE base_total >= 500 
  AND height_m > 1.5;

-- 9. Múltiplos atributos com AND
SELECT name, type1, type2, against_fire, against_water 
FROM pokemon 
WHERE against_fire >= 2 
  AND against_water >= 2;

-- 10. Lógica composta com AND, OR e operador diferente (<> ou !=)
SELECT name, capture_rate, generation, hp, type1 
FROM pokemon 
WHERE capture_rate = '45' 
  AND (generation = 1 OR hp > 70) 
  AND type1 <> 'normal';
