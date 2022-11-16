# DOCKER &AMP; DOCKER COMPOSE

## Docker Installation

```bash
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose

docker version
docker-compose version

```

### Pull MySQL Image

```bash
docker pull mysql/mysql-server:latest
docker images
docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=dapetoo -d mysql/mysql-server:latest
docker logs mysql-db
docker exec -it mysql-db mysql -u root -p
docker exec -it mysql-db bash

docker rm -f mysql-db # Force remove active container
docker stop mysql-db # Stop the container
docker rm mysql-db # Remove the container

# DOCKER Network
docker network ls

docker network create --subnet=172.18.0.0/24 tooling_app_network # Create a network

## Run the container with the network
export MYSQL_PW=dapetoo
docker run --network tooling_app_network -h mysqlserverhost --name=mysql-server -e MYSQL_ROOT_PASSWORD=$MYSQL_PW  -d mysql/mysql-server:latest 

docker network inspect tooling_app_network

### Create script to create a user
create_user.sql
CREATE USER ''@'%' IDENTIFIED BY ''; GRANT ALL PRIVILEGES ON * . * TO ''@'%';

### MySQL Client
docker run --network tooling_app_network --name mysql-client -it --rm mysql mysql -h mysqlserverhost -u  -p 

docker exec -i mysql-server mysql -uroot -p$MYSQL_PW < create_user.sql 

git clone https://github.com/darey-devops/tooling.git

docker exec -i mysql-server mysql -uroot -p$MYSQL_PW < tooling_db_schema.sql

docker build -t tooling:0.0.1 .

docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.1 