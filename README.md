```bash
  docker compose up --build -d
```

```bash
  docker compose exec php-cli bash -c "composer create-project laravel/laravel example-app"
```

```bash
  mv example-app/* ./
```

```bash
  mv example-app/.* ./
```

```bash
  rm -rf example-app
```

```bash 
  sudo chmod 777 -R storage/
```

```dotenv
# ./src/.env
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=secret
```

```bash
  docker compose exec php-fpm bash -c "php artisan migrate"
```
