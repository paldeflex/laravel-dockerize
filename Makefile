.PHONY: setup

setup:
	docker compose up --build -d
	sudo chown -R $$(id -u):$$(id -g) ./src
	@cp ./src/.env.example ./src/.env 2>/dev/null || true
	docker compose exec php-cli composer install
	sudo chmod -R 777 ./src/storage
	docker compose exec php-cli php artisan key:generate --ansi
	docker compose exec php-cli php artisan migrate --ansi
