# 🐳 Instalação do MySQL via Docker

Este guia mostra como subir rapidamente uma instância do MySQL utilizando Docker, permitindo acesso externo e com permissões configuradas para o usuário `root`.

## ✅ Pré-requisitos

Antes de seguir qualquer uma das abordagens, verifique se você possui:

- Acesso como administrador na máquina
- [Docker instalado](https://www.docker.com/get-started) (para a instalação via Docker)
- Acesso à internet para download dos pacotes

## 📦 Passo a Passo da Instalação

### 1. Crie uma rede Docker personalizada

Isso facilita a comunicação entre contêineres no mesmo ambiente isolado.

```bash
docker network create some-network
```

### 2. Suba o container do MySQL

Neste exemplo, o nome do container será `teste-mysql`, a senha do root será a que você definir, e a porta local 3306 será exposta.

```bash
docker run --name teste-mysql --network some-network -p 3306:3306 -e MYSQL_ROOT_PASSWORD=teste -d mysql:latest
```

### 3. Acesse o MySQL pela linha de comando

Você pode usar outro container temporário para se conectar ao MySQL:

```bash
docker run -it --network some-network --rm mysql mysql -h teste-mysql -u root -p
```

Digite a senha: `teste`


### 4. Configure o usuário `root` para permitir conexões externas

Execute os comandos SQL abaixo no prompt do MySQL:

```sql
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'teste';
FLUSH PRIVILEGES;

-- Caso o comando acima não funcione, crie o usuário manualmente:
CREATE USER 'root'@'%' IDENTIFIED BY 'teste';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### 5. Verifique o endereço de bind do MySQL

Esse passo é para confirmar se o MySQL está escutando em todas as interfaces:

```bash
docker exec -it teste-mysql mysql -u root -p -e "SHOW VARIABLES LIKE 'bind_address';"
```

### 6. Altere o bind address para permitir acesso externo

Esse comando sobrescreve o arquivo de configuração principal do MySQL dentro do container, permitindo conexões externas:

```bash
docker exec -it teste-mysql sh -c "echo '[mysqld]\nbind-address = 0.0.0.0' > /etc/mysql/my.cnf"
```

## 🧹 Remover o ambiente

```bash
docker stop teste-mysql
docker rm teste-mysql
docker network rm some-network
```
