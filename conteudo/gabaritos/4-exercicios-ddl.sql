Gabarito 1
SQL
CREATE TABLE ginasio (
    id_ginasio INT AUTO_INCREMENT PRIMARY KEY,
    nome_ginasio VARCHAR(100) NOT NULL,
    tipo_especialidade VARCHAR(50) NOT NULL,
    lider_nome VARCHAR(100),
    insignia_nome VARCHAR(50) UNIQUE
);

Explicação: PRIMARY KEY define o identificador único e AUTO_INCREMENT gera os números automaticamente. NOT NULL impede valores vazios e UNIQUE garante que nenhuma insígnia tenha nome repetido.

Gabarito 2
SQL
-- Adicionando a nova coluna
ALTER TABLE ginasio 
    ADD nivel_minimo INT DEFAULT 10;

-- Modificando a coluna existente para NOT NULL
ALTER TABLE ginasio 
    MODIFY lider_nome VARCHAR(100) NOT NULL;
Explicação: O comando ADD cria a coluna com valor padrão 10. O comando MODIFY redefine as propriedades da coluna mantendo o tipo VARCHAR(100) e adicionando a restrição NOT NULL.

Gabarito 3
SQL
-- Renomeando a coluna
ALTER TABLE ginasio 
    CHANGE lider_nome nome_lider VARCHAR(100) NOT NULL;

-- Removendo a coluna
ALTER TABLE ginasio 
    DROP COLUMN nivel_minimo;
Explicação: No MySQL, utiliza-se CHANGE [nome_antigo] [nome_novo] [tipo] para renomear colunas. O comando DROP COLUMN exclui o campo desejado.

Gabarito 4
SQL
CREATE TABLE treinador_ginasio (
    id_conquista INT AUTO_INCREMENT PRIMARY KEY,
    id_treinador INT NOT NULL,
    id_ginasio INT NOT NULL,
    data_conquista DATE NOT NULL,
    CONSTRAINT fk_conquista_treinador 
        FOREIGN KEY (id_treinador) 
        REFERENCES treinador_meunome(id_treinador)
        ON DELETE CASCADE,
    CONSTRAINT fk_conquista_ginasio 
        FOREIGN KEY (id_ginasio) 
        REFERENCES ginasio(id_ginasio)
        ON DELETE CASCADE
);
Explicação: As cláusulas FOREIGN KEY criam os vínculos com as tabelas pai. O parâmetro ON DELETE CASCADE faz com que, ao deletar um ginásio ou treinador, o histórico de conquistas associado seja apagado automaticamente.

Gabarito 5
SQL
DROP TABLE IF EXISTS treinador_ginasio;
Explicação: O comando DROP TABLE apaga a estrutura e todos os dados da tabela. A cláusula IF EXISTS previne que a instrução resulte em erro caso a tabela não esteja presente no banco.
