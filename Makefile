.PHONY: setup start

setup:
	docker compose up --build -d
	@cp ./src/.env.example ./src/.env 2>/dev/null || true
	docker compose exec php-cli composer install
	docker compose exec --user root php-cli \
		chmod -R 777 /var/www/storage /var/www/bootstrap/cache
	docker compose exec php-cli php artisan key:generate --ansi

	@sleep 10

	docker compose exec php-cli php artisan migrate --ansi


start:
	docker compose up -d
