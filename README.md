# Heracles Reverse Proxy
 
Reverse proxy service for Heracles project using **nginx**.
 
## Requirements
 
 - Docker

## Configuration

1. Copy `.env.example` to `.env` and configure the required variables.
```yaml
SERVER_NAME=localhost
```

2. Run the container
```sh
docker compose up -d
```

## Stop the service

1. Stop and delete the container
```sh
docker-compose down
```
