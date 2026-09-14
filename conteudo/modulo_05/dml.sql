Exemplos Práticos de DML
1. Inserção Válida (INSERT INTO)
Adicionando um novo registro relacionando o treinador 2 (Misty) ao Pokémon Psyduck (pokedex_number = 54):

INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (2, 54, 'Duck', 15);

2. Tentar Inserir Pokémon Inexistente (Erro de FK)
Tentativa de inserir um Pokémon com pokedex_number = 200 (quando o limite do banco é 151):

INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (1, 200, 'Mewtwo', 70);
-- ERRO: Cannot add or update a child row: a foreign key constraint fails.
-- Motivo: O número 200 não existe na tabela pai 'pokemon'.
3. Tentar Inserir Treinador Inexistente (Erro de FK)
Tentativa de associar um Pokémon a um treinador_id = 99 que não está cadastrado:

INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (2000, 25, 'Sparky', 10);
-- Motivo: O treinador_id 2000 não existe na tabela pai 'treinadores'.

4. Atualização de Treinador / Transferência (UPDATE)
Transferindo o Charmander (captura_id = 2 ou apelido = 'Charry') do Treinador 1 (Ash) para o Treinador 3 (Brock):

UPDATE treinador_pokemons 
SET treinador_id = 3 
WHERE apelido = 'Charry' AND treinador_id = 1;


5. Atualização de Dados do Pokémon (UPDATE)
Aumentando o nível e alterando o apelido de um Pokémon após uma evolução (ex: de Pikachu 25 para Raichu 26):

UPDATE treinador_pokemons 
SET pokedex_number = 26, 
    apelido = 'Rai', 
    nivel = 55 
WHERE treinador_id = 1 AND apelido = 'Pika';

6. Exclusão de Relacionamento / Liberação do Pokémon (DELETE)
Removendo a relação de um Pokémon específico com o seu mestre (simulando a liberação do Pokémon para a natureza):

DELETE FROM treinador_pokemons 
WHERE treinador_id = 2 AND apelido = 'Bubble';
