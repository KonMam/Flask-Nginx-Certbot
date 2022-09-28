# NGINX-FLASK-CERTBOT Template

This is an easy to use template for quickly launching https websites with docker.

## Installation

- SSH into your server

```bash
apt update
```

```bash
apt upgrade
```

- Add type 'A' record to the server on your DNS provider

- Install docker and docker compose

```bash
apt install docker.io
```

```bash
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
```

- Clone the repository

```bash
git clone https://github.com/KonMam/test-python-app
```

- Add your domain to nginx config and comment out SSL part to start the server

```bash
nano nginx/conf/app.conf
```

```bash
docker compose build
docker compose create
docker start nginx server
```

- Fill the folder with certificates

```bash
docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d example.org --email email@email.com --agree-tos
```

- Uncomment SSL part in nginx config and rebuild docker containers

```bash
nano nginx/conf/app.conf
```
```bash
docker compose up --build -d
```

## Additional Notes

A good step by step guide for the nginx/certbot part can be found on:
- https://mindsers.blog/post/https-using-nginx-certbot-docker/
