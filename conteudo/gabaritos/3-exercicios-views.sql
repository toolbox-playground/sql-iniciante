## Parte 1: Tabelas Temporárias (`TEMPORARY TABLE`)

Tabelas temporárias armazenam dados provisórios que existem apenas durante a sessão atual do banco de dados.

### Exercício 1: Pokémon do Tipo Fogo (Fire)

**Objetivo:** Criar uma tabela temporária chamada `tmp_fire_pokemon` contendo o número da Pokédex, nome, tipo secundário, ataque e defesa de todos os Pokémon cujo `type1` seja `'fire'`. Em seguida, selecione todos os registros da tabela criada ordenando pelo ataque do maior para o menor.

```sql
-- Criando a tabela temporária
CREATE TEMPORARY TABLE tmp_fire_pokemon AS
SELECT 
    pokedex_number,
    name,
    type2,
    attack,
    defense
FROM pokemon
WHERE type1 = 'fire';

-- Consultando os dados da tabela temporária
SELECT * 
FROM tmp_fire_pokemon 
ORDER BY attack DESC;

```

---

### Exercício 2: Métricas Físicas por Geração

**Objetivo:** Criar uma tabela temporária chamada `tmp_stats_geracao` que agregue por geração (`generation`): a quantidade de Pokémon, a média de peso (`weight_kg`) e a média de altura (`height_m`).

```sql
CREATE TEMPORARY TABLE tmp_stats_geracao AS
SELECT 
    generation,
    COUNT(*) AS total_pokemon,
    ROUND(AVG(weight_kg), 2) AS media_peso,
    ROUND(AVG(height_m), 2) AS media_altura
FROM pokemon
GROUP BY generation;

SELECT * FROM tmp_stats_geracao;

```

---

## Parte 2: Visualizações (`VIEW`)

`VIEWS` são tabelas virtuais baseadas no resultado de uma consulta SQL. Elas não armazenam dados fisicamente, mas facilitam a reutilização de queries complexas.

### Exercício 3: View de Pokémon Lendários

**Objetivo:** Criar uma `VIEW` chamada `vw_legendary_pokemon` que exiba o número da Pokédex, nome, tipo principal (`type1`), total de atributos básicos (`base_total`) e geração de todos os Pokémon onde `is_legendary = 1`.

```sql
CREATE VIEW vw_legendary_pokemon AS
SELECT 
    pokedex_number,
    name,
    type1,
    base_total,
    generation
FROM pokemon
WHERE is_legendary = 1;

-- Testando a VIEW
SELECT * FROM vw_legendary_pokemon;

```

---

### Exercício 4: View com Classificação de IMC (Índice de Massa Corporal)

**Objetivo:** Criar uma `VIEW` chamada `vw_pokemon_imc` que calcule o IMC aproximado dos Pokémon com dados de altura e peso válidos.

* Fórmula: $\text{IMC} = \frac{\text{peso}}{\text{altura}^2}$
* Retorne: `pokedex_number`, `name`, `height_m`, `weight_kg` e o IMC arredondado para 2 casas decimais.

```sql
CREATE VIEW vw_pokemon_imc AS
SELECT 
    pokedex_number,
    name,
    height_m,
    weight_kg,
    ROUND(weight_kg / (height_m * height_m), 2) AS imc
FROM pokemon
WHERE height_m IS NOT NULL 
  AND weight_kg IS NOT NULL 
  AND height_m > 0;

-- Consultando Pokémon com maior IMC
SELECT * 
FROM vw_pokemon_imc 
ORDER BY imc DESC;

```

---

### Exercício 5: View Analítica por Tipo Principal

**Objetivo:** Criar uma `VIEW` chamada `vw_resumo_tipos` agrupando por `type1` e calculando:

1. Total de Pokémon por tipo.
2. Média de HP (`hp`).
3. Média de Ataque (`attack`).
4. Média de Defesa (`defense`).
5. Média de Velocidade (`speed`).

```sql
CREATE VIEW vw_resumo_tipos AS
SELECT 
    type1 AS tipo,
    COUNT(*) AS qtd_pokemon,
    ROUND(AVG(hp), 1) AS media_hp,
    ROUND(AVG(attack), 1) AS media_ataque,
    ROUND(AVG(defense), 1) AS media_defesa,
    ROUND(AVG(speed), 1) AS media_velocidade
FROM pokemon
GROUP BY type1;

-- Testando a VIEW ordenando por média de ataque
SELECT * 
FROM vw_resumo_tipos 
ORDER BY media_ataque DESC;

```
