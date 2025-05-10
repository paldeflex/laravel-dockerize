```bash
  docker compose up --build -d
```

```bash
  sudo chown -R $(id -u):$(id -g) ./src
```

```bash
  cp ./src/.env.example ./src/.env
```

```bash
  docker compose exec php-cli composer install
```

```bash 
  sudo chmod 777 -R ./src/storage
```

```bash
  docker compose exec php-cli bash -c "php artisan key:generate"
```

```bash
  docker compose exec php-cli bash -c "php artisan migrate"
```