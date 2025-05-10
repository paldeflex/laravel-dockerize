#!/usr/bin/env bash
set -e

docker compose up --build -d

if [ ! -f ./src/.env ]; then
  cp ./src/.env.example ./src/.env
  echo "Created src/.env"
fi

docker compose exec php-cli composer install

sudo chmod -R 777 ./src/storage

docker compose exec php-cli bash -c "php artisan key:generate"

docker compose exec php-fpm bash -c "php artisan migrate"

echo "✅ Setup complete!"
