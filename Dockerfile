FROM php:8.5-fpm
RUN apt-get update && apt-get install -y --no-install-recommends libcurl4-openssl-dev libzip-dev && docker-php-ext-install curl zip

WORKDIR /var/www/alice-deepseek
COPY . .


COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer install --no-interaction --optimize-autoloader

CMD ["php-fpm"]
