# Edit login before launching !
LOGIN =		login
DOMAIN =	${LOGIN}.42.fr
DATA_PATH = /home/${LOGIN}/data
ENV =		LOGIN=${LOGIN} DATA_PATH=${DATA_PATH} DOMAIN=${LOGIN}.42.fr 

all: up

up: setup
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

status:
	cd srcs && docker-compose ps && cd ..

logs:
	cd srcs && docker-compose logs && cd ..

setup:
	${ENV} ./configure-login.sh
	${ENV} ./configure-hosts.sh
	sudo mkdir -p ${DATA_PATH}/mariadb-data
	sudo mkdir -p ${DATA_PATH}/wordpress-data

clean:
	sudo rm -rf ${DATA_PATH}

fclean: clean
	${ENV} ./clear-login.sh
	docker system prune -f -a --volumes
	docker volume rm srcs_mariadb-data srcs_wordpress-data

.PHONY: all up down start stop status logs prune clean fclean