DOCKER_COMPOSE = srcs/docker-compose.yml
# WP =  
# mkdir db wordpress
all: up

up:
	docker-compose -f $(DOCKER_COMPOSE) up -d

up2:
	rm -rf ${HOME}/codam_project/inception/db
	rm -rf ${HOME}/codam_project/inception/wp
	mkdir -p ${HOME}/codam_project/inception/db
	mkdir -p ${HOME}/codam_project/inception/wp
	docker-compose -f $(DOCKER_COMPOSE) up -d --no-deps --build --force-recreate

down:
	docker-compose -f $(DOCKER_COMPOSE) down

clean: down
	docker system prune -af
	docker volume prune -f

fclean: clean


re: fclean all
