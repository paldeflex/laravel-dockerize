FROM php:8.4.6-cli

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      libpng-dev \
    && docker-php-ext-install pdo_mysql pcntl exif \
    && curl -sS https://getcomposer.org/installer | \
       php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /var/lib/apt/lists/*

USER 1000:1000
WORKDIR /var/www
