up:
	docker-compose up -d --build

down:
	docker-compose down

elastic:
	docker-compose exec elastic bash