import pandas as pd
import math

df = pd.read_csv('pokemon.csv')

columns_order = [
    'pokedex_number', 'name', 'japanese_name', 'classfication', 'type1', 'type2', 'abilities',
    'hp', 'attack', 'defense', 'sp_attack', 'sp_defense', 'speed', 'base_total',
    'base_egg_steps', 'base_happiness', 'experience_growth', 'capture_rate', 'percentage_male',
    'height_m', 'weight_kg', 'generation', 'is_legendary',
    'against_bug', 'against_dark', 'against_dragon', 'against_electric', 'against_fairy',
    'against_fight', 'against_fire', 'against_flying', 'against_ghost', 'against_grass',
    'against_ground', 'against_ice', 'against_normal', 'against_poison', 'against_psychic',
    'against_rock', 'against_steel', 'against_water'
]

def format_val(val):
    if pd.isna(val) or val is None:
        return 'NULL'
    if isinstance(val, (int, float)):
        if math.isnan(val):
            return 'NULL'
        if isinstance(val, float) and val.is_integer():
            return str(int(val))
        return str(val)
    s = str(val).replace("\\", "\\\\").replace("'", "''")
    return f"'{s}'"

insert_cols = ", ".join([f"`{c}`" for c in columns_order])

# Let's inspect the first 5 rows to output as an explicit snippet, and write out how to insert all 801 rows
rows_sql = []
for idx, row in df.head(152).iterrows():
    vals = [format_val(row[c]) for c in columns_order]
    rows_sql.append(f"({', '.join(vals)})")

print("INSERT INTO `pokemon` (" + insert_cols + ")\nVALUES\n" + ",\n".join(rows_sql) + ";")