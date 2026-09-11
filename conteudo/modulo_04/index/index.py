import random
from datetime import datetime, timedelta

# Sample lists for random data generation
first_names = [
    "Lucas", "Gabriel", "Matheus", "Pedro", "Guilherme", "Gustavo", "Felipe", 
    "Rafael", "João", "Enzo", "Sophia", "Julia", "Alice", "Manuela", "Isabella", 
    "Luiza", "Helena", "Giovanna", "Maria", "Beatriz", "Bruno", "Caio", "Thiago"
]

last_names = [
    "Silva", "Santos", "Oliveira", "Souza", "Rodrigues", "Ferreira", "Alves", 
    "Pereira", "Lima", "Gomes", "Costa", "Ribeiro", "Martins", "Carvalho", 
    "Almeida", "Lopes", "Soares", "Fernandes", "Vieira", "Barbosa"
]

cities = [
    "Pallet Town", "Viridian City", "Pewter City", "Cerulean City", 
    "Vermilion City", "Celadon City", "Fuchsia City", "Saffron City", 
    "Cinnabar Island", "Campinas", "São Paulo", "Rio de Janeiro", 
    "Curitiba", "Belo Horizonte", "Porto Alegre", "Salvador"
]

# Date range: between Jan 1, 2020 and Sept 11, 2026
start_date = datetime(2020, 1, 1)
end_date = datetime(2026, 9, 11)
days_range = (end_date - start_date).days

rows = []

for _ in range(999):
    # Generate random name, city, date, and badges (0 to 8)
    nome = f"{random.choice(first_names)} {random.choice(last_names)}".replace("'", "''")
    cidade = random.choice(cities).replace("'", "''")
    
    random_days = random.randint(0, days_range)
    data_inicio = (start_date + timedelta(days=random_days)).strftime('%Y-%m-%d')
    
    insignias = random.randint(0, 8)
    
    rows.append(f"    ('{nome}', '{cidade}', '{data_inicio}', {insignias})")

# Build full SQL INSERT statement
sql_statement = (
    "-- Inserindo 999 Treinadores Aleatórios\n"
    "INSERT INTO treinadores (nome, cidade_natal, data_inicio, insignias) \nVALUES \n"
    + ",\n".join(rows) + ";"
)

# Save output to insert_trainers.sql
with open("insert_trainers.sql", "w", encoding="utf-8") as file:
    file.write(sql_statement)

print("File 'insert_trainers.sql' generated successfully with 999 records!")
