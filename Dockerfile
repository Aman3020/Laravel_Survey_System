FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git curl zip unzip libzip-dev libpng-dev libonig-dev libxml2-dev libcurl4-openssl-dev \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . .

RUN composer install 
RUN chown -R www-data:www-data /var/www

EXPOSE 9000
CMD ["php-fpm"]