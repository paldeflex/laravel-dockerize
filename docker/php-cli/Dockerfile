FROM php:8.4.6-cli

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      libmcrypt-dev \
      mariadb-client \
      cron \
      wget \
      unzip \
      curl \
 && docker-php-ext-configure exif \
 && docker-php-ext-install -j"$(nproc)" \
      pdo_mysql \
      pcntl \
      exif \
 && docker-php-ext-enable exif \
 \
 && curl -sS https://getcomposer.org/installer \
      | php -- --install-dir=/usr/local/bin --filename=composer \
 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER 1000:1000
WORKDIR /var/www
