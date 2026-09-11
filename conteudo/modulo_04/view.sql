CREATE VIEW vw_poke AS SELECT type1,name FROM pokemon;
SELECT * FROM vw_poke_grass;
CREATE VIEW vw_poke_grass AS SELECT type1,name FROM pokemon where type1 = 'grass';
