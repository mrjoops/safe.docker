FROM php:apache

RUN apt-get update \
 && apt-get install -y libpq-dev libzip-dev unzip \
 && docker-php-ext-install pdo_pgsql zip \
 && printf "\n" | pecl install apcu \
 && docker-php-ext-enable apcu

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /app
