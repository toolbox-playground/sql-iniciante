CREATE DATABASE IF NOT EXISTS pokemon_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE pokemon_db;

CREATE TABLE IF NOT EXISTS pokemon (
    pokedex_number INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    japanese_name VARCHAR(100),
    classfication VARCHAR(100),
    type1 VARCHAR(50) NOT NULL,
    type2 VARCHAR(50),
    abilities VARCHAR(255),
    
    -- Base Stats
    hp SMALLINT UNSIGNED NOT NULL,
    attack SMALLINT UNSIGNED NOT NULL,
    defense SMALLINT UNSIGNED NOT NULL,
    sp_attack SMALLINT UNSIGNED NOT NULL,
    sp_defense SMALLINT UNSIGNED NOT NULL,
    speed SMALLINT UNSIGNED NOT NULL,
    base_total INT UNSIGNED NOT NULL,
    
    -- Growth & Breeding
    base_egg_steps INT UNSIGNED,
    base_happiness SMALLINT UNSIGNED,
    experience_growth INT UNSIGNED,
    capture_rate VARCHAR(50),
    percentage_male DECIMAL(5, 2),
    
    -- Physical Characteristics
    height_m DECIMAL(5, 2),
    weight_kg DECIMAL(6, 2),
    
    -- Metadata
    generation TINYINT UNSIGNED NOT NULL,
    is_legendary TINYINT(1) NOT NULL DEFAULT 0,
    
    -- Type Effectiveness Multipliers
    against_bug DECIMAL(3, 2) NOT NULL,
    against_dark DECIMAL(3, 2) NOT NULL,
    against_dragon DECIMAL(3, 2) NOT NULL,
    against_electric DECIMAL(3, 2) NOT NULL,
    against_fairy DECIMAL(3, 2) NOT NULL,
    against_fight DECIMAL(3, 2) NOT NULL,
    against_fire DECIMAL(3, 2) NOT NULL,
    against_flying DECIMAL(3, 2) NOT NULL,
    against_ghost DECIMAL(3, 2) NOT NULL,
    against_grass DECIMAL(3, 2) NOT NULL,
    against_ground DECIMAL(3, 2) NOT NULL,
    against_ice DECIMAL(3, 2) NOT NULL,
    against_normal DECIMAL(3, 2) NOT NULL,
    against_poison DECIMAL(3, 2) NOT NULL,
    against_psychic DECIMAL(3, 2) NOT NULL,
    against_rock DECIMAL(3, 2) NOT NULL,
    against_steel DECIMAL(3, 2) NOT NULL,
    against_water DECIMAL(3, 2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
