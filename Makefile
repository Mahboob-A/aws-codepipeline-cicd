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


################# Prod #################
docker-up-prod: 
	docker compose -f prod.yml up --build -d --remove-orphans

docker-down-prod: 
	docker compose -f prod.yml down

docker-down-v-prod: 
	docker compose -f prod.yml down -v

docker-logs-prod: 
	docker compose -f prod.yml logs 

docker-logs-api-prod: 
	docker compose -f prod.yml logs api

docker-restart-api-prod: 
	docker compose -f prod.yml restart api

docker-exec-api-prod: 
	docker compose -f prod.yml exec api /bin/bash