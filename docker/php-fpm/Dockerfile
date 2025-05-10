FROM php:8.4.6-fpm

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      libmcrypt-dev \
      libpng-dev \
      libjpeg-dev \
      libfreetype6-dev \
      libgd-dev \
      mariadb-client \
      wget \
      unzip \
      curl \
      jpegoptim \
      optipng \
      pngquant \
      gifsicle \
      libavif-bin \
 && docker-php-ext-configure exif \
 && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      --with-jpeg=/usr/include/ \
      --with-webp=/usr/include/ \
 && docker-php-ext-install -j"$(nproc)" \
      pdo_mysql \
      pcntl \
      exif \
      gd \
 && docker-php-ext-enable exif \
 \
 && curl -sS https://getcomposer.org/installer \
      | php -- --install-dir=/usr/local/bin --filename=composer \
 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www
