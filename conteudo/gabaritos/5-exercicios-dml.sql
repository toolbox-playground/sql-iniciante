Gabarito 1
INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (3, 95, 'Rock', 30);
-- Explicação: Insere uma nova linha especificando explicitamente os campos obrigatórios e correspondentes.

Gabarito 2
UPDATE treinador_pokemons 
SET nivel = nivel + 5 
WHERE treinador_id = 1 AND apelido = 'Pika';
-- Explicação: Utiliza a própria coluna nivel em nivel + 5 para realizar o incremento relativo, usando a cláusula WHERE para filtrar o Pokémon e o treinador corretos.

Gabarito 3
SQL
UPDATE treinador_pokemons 
SET treinador_id = 2 
WHERE treinador_id = 3 AND apelido = 'Bulby';
-- Explicação: Altera a chave estrangeira treinador_id de 3 para 2 mantendo o relacionamento correto com a tabela de treinadores.

Gabarito 4
Resposta: O comando falhará e retornará um erro de violação de chave estrangeira (Foreign Key Constraint Failure). Isso ocorre porque a tabela treinador_pokemons possui uma restrição (CONSTRAINT fk_pokemon) que exige que todo pokedex_number inserido exista previamente na tabela pai pokemon. Como o ID 152 não existe na tabela pai, a integridade referencial impede a inserção.

Gabarito 5
DELETE FROM treinador_pokemons 
WHERE treinador_id = 1 AND apelido = 'Charry';
-- Explicação: O comando DELETE FROM remove o registro que atende a ambas as condições do WHERE, desfazendo o vínculo entre o treinador e o Pokémon.
