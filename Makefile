build:
	docker build -t appleboy/nginx-image-resizer .

up:
	docker-compose $@

down:
	docker-compose $@
