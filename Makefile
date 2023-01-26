DOCKER_COMPOSE = srcs/docker-compose.yml
# WP =  
# mkdir db wordpress

all: up

up:
	docker-compose -f $(DOCKER_COMPOSE) up -d --no-deps --build

down:
	docker-compose -f $(DOCKER_COMPOSE) down

clean: down
	docker system prune -af
	docker volume prune -f

fclean: clean


re: fclean all
