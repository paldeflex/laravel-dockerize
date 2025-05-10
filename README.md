```bash
  docker compose up --build -d
```

```bash
  cp .env.example .env
```

```bash
  docker compose exec php-cli composer install
```

```bash
  docker compose exec php-cli bash -c "php artisan key:generate"
```

```bash
  sudo chown -R $(id -u):$(id -g) src
```

```bash 
  sudo chmod 777 -R ./src/storage
```

```bash
  docker compose exec php-fpm bash -c "php artisan migrate"
```
