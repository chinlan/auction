# Docker-compose: rails, postgres, redis, elasticsearch, sidekiq

## Setup
- Build docker images: `docker-compose build`
- Create database: `docker-compose run auction rake db:create`
- Run migration: `docker-compose run auction rake db:migrate`
- Run docker compose: `docker-compose up`
- Open another console and connect to rails container: `docker-compose exec auction bash`
