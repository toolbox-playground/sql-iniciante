-- Podemos usar ASC ou DESC para, ascendendo ou descendendo 
SELECT * FROM pokemon ORDER BY name DESC;

-- Podemos ordenar por mais de uma coluna também
SELECT * FROM pokemon ORDER BY attack DESC, name DESC;

-- Podemos também limitar os resultados usando a função LIMIT
SELECT * FROM pokemon ORDER BY attack DESC, name DESC LIMIT 5;

-- Podemos agrupar os resultados usando o GROUP BY
SELECT type1 FROM pokemon GROUP BY type1;
SELECT type1,COUNT(1)AS quantidade FROM pokemon GROUP BY type1;

-- Podemos agrupar os resultados usando o GROUP BY
SELECT type1 FROM pokemon GROUP BY type1;
SELECT type1,COUNT(1)AS quantidade
FROM pokemon GROUP BY type1
ORDER BY quantidade DESC;

-- Podemos também agrupar as informações utilizando funções
SELECT COUNT(1) AS quantidade,
MAX(speed) AS velocidade_maxima,
MIN(defense) AS minima_defesa,
AVG(attack) AS media_ataque
FROM pokemon GROUP BY type1;

-- Podemos também agrupar as informações utilizando funções
SELECT COUNT(1) AS quantidade,
MAX(speed) AS velocidade_maxima,
MIN(defense) AS minima_defesa,
AVG(attack) AS media_ataque
FROM pokemon GROUP BY type1
ORDER BY type1;

-- Roll up
SELECT type1, type2, COUNT(1)
FROM pokemon 
GROUP BY type1,type2
WITH ROLLUP;

-- Agrupando os dados e filtrando com HAVING
SELECT type1, COUNT(1) as quantidade, AVG(attack) AS media_ataque 
FROM pokemon 
GROUP BY type1 HAVING AVG(attack) > 80 
ORDER BY type1,COUNT(1) DESC;
