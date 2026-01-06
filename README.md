# Heracles Reverse Proxy

Reverse proxy service for Heracles project using **nginx**.  
SSL certificates are managed using **Certbot** with **Let's Encrypt** and automatically renewed via DNS-01 using **OVH** provider.

## Requirements

 - Docker

## Configuration

1. Copy `.env.example` to `.env` and configure the required variables.
```yaml
SERVER_NAME=localhost
```

2. Copy `ovh.ini.example` to `ovh.ini` and configure the credentials.
```ini
dns_ovh_endpoint=ovh-eu
dns_ovh_application_key=
dns_ovh_application_secret=
dns_ovh_consumer_key=
```

3. Manually create your first SSL certificate before starting the service.
```sh
docker compose run --rm certbot certonly \
    --dns-ovh \
    --dns-ovh-credentials /ovh.ini \
    -d ${SERVER_NAME} \
    -d *.${SERVER_NAME}
```

4. Run the nginx container
```sh
docker compose up -d nginx
```

5. Run the certbot container to enable automatic renewal
```sh
docker compose up -d certbot
```

## Stop the service

1. Stop and delete both containers
```sh
docker compose down
```
