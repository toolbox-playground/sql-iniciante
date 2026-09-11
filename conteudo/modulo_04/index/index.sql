1. Single-Column Index Script (idx_treinadores_cidade)

SQL
-- Single-Column Index on cidade_natal
CREATE INDEX idx_treinadores_cidade 
ON treinadores (cidade_natal);
Best for queries like:

SQL
SELECT * FROM treinadores WHERE cidade_natal = 'Campinas';


2. Composite Index Script (idx_treinadores_cidade_insignias)
SQL
-- Composite Index on cidade_natal and insignias
CREATE INDEX idx_treinadores_cidade_insignias 
ON treinadores (cidade_natal, nome);
Best for queries like:

SQL
-- Filters by both city and badge count
SELECT * FROM treinadores 
WHERE cidade_natal = 'Campinas' AND nome = 'Thiago Silva';

SELECT * FROM treinadores 
WHERE nome = 'Thiago Silva' AND cidade_natal = 'Campinas';
