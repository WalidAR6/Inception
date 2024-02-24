export HOST=$(shell hostname -I | awk '{ print $$1 }')

DATA_WWW="${HOME}/data/www"
DATA_DB="${HOME}/data/db"

all: up

create:
	@mkdir -m 777 -p ${HOME}/data
	@mkdir -m 777 -p ${HOME}/data/www
	@mkdir -m 777 -p ${HOME}/data/db

up: create
	docker-compose -f src/docker-compose.yml up

build: create
	docker-compose -f src/docker-compose.yml up --build

down:
	docker-compose -f src/docker-compose.yml down -v

start:
	docker-compose -f src/docker-compose.yml start 

stop:
	docker-compose -f src/docker-compose.yml stop 

restart: down start

clean: down
	docker system prune -af

re: down build
