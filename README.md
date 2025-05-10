```bash
  docker compose up --build -d
```

```bash
  sudo chown -R $(id -u):$(id -g) src
```

```bash
  docker compose exec php-cli bash -c "composer create-project laravel/laravel ."
```

```bash 
  sudo chmod 777 -R ./src/storage
```

```bash
  cp .env.example .env
```

```bash
  docker compose exec php-fpm bash -c "php artisan migrate"
```
