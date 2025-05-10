#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(realpath "$SCRIPT_DIR/..")"
SRC_DIR="$PROJECT_ROOT/src"

cd "$PROJECT_ROOT"

docker compose up --build -d

sudo chown -R "$(id -u):$(id -g)" "$SRC_DIR"

if [ ! -f "$SRC_DIR/.env" ]; then
  cp "$SRC_DIR/.env.example" "$SRC_DIR/.env"
fi

docker compose exec php-cli composer install

sudo chmod -R 777 "$SRC_DIR/storage"

docker compose exec php-cli bash -c "php artisan key:generate"

docker compose exec php-fpm bash -c "php artisan migrate"

echo "✅ Установка завершена!"
