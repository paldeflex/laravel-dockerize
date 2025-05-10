#!/bin/bash

set -e

print_step() {
  echo -e "$1..."
}

print_info() {
  echo -e "    $1"
}

print_step "🛑 Остановка всех контейнеров"
containers=$(docker ps -q)
if [ -n "$containers" ]; then
    docker stop $containers > /dev/null
else
    print_info "ℹ️ Контейнеров для остановки нет."
fi
echo

print_step "🗑️ Удаление всех контейнеров"
all_containers=$(docker ps -aq)
if [ -n "$all_containers" ]; then
    docker rm -f $all_containers > /dev/null
else
    print_info "ℹ️ Контейнеров для удаления нет."
fi
echo

print_step "🧯 Удаление всех образов"
images=$(docker images -q)
if [ -n "$images" ]; then
    docker rmi -f $images > /dev/null
else
    print_info "ℹ️ Образов для удаления нет."
fi
echo

print_step "🌐 Удаление сети 'laravel_network'"
if docker network inspect laravel_network > /dev/null 2>&1; then
    docker network rm laravel_network > /dev/null
else
    print_info "ℹ️ Сеть не найдена или уже удалена."
fi
echo

print_step "📦 Удаление всех томов"
volumes=$(docker volume ls -q)
if [ -n "$volumes" ]; then
    docker volume rm $volumes > /dev/null
else
    print_info "ℹ️ Томов для удаления нет."
fi
echo

print_step "🧹 Очистка кэша Docker (builder)"
docker builder prune --all --force > /dev/null
print_info "✔️ Кэш Docker builder очищен."
echo

print_step "🗂️ Удаление локальной папки ./docker/volume/"
if [ -d "./docker/volume/" ]; then
    sudo rm -rf ./docker/volume/
    print_info "🧹 Папка ./docker/volume/ удалена."
else
    print_info "ℹ️ Папка ./docker/volume/ не найдена, пропускаю."
fi
echo

print_step "🗑️ Удаление папки ./src"
if [ -d "./src" ]; then
    rm -rf ./src
    print_info "🧹 Папка ./src удалена."
else
    print_info "ℹ️ Папка ./src не найдена, пропускаю."
fi
echo

print_step "🗃️ Удаление пользовательского кэша Docker: ~/.docker"
if [ -d "$HOME/.docker" ]; then
    rm -rf "$HOME/.docker"
    print_info "🧹 Папка ~/.docker удалена."
else
    print_info "ℹ️ Папка ~/.docker не найдена, пропускаю."
fi
echo

echo "✅  Полная очистка завершена!"
