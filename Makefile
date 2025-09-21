docker-up: 
	docker compose -f dev.yml up --build -d --remove-orphans 

docker-down: 
	docker compose -f dev.yml down

docker-down-v: 
	docker compose -f dev.yml down -v

docker-logs: 
	docker compose -f dev.yml logs 

docker-logs-api: 
	docker compose -f dev.yml logs api 

docker-restart-api: 
	docker compose -f dev.yml restart api 

docker-exec-api: 
	docker compose -f dev.yml exec api /bin/bash 