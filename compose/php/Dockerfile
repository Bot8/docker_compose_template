FROM php:5.5-fpm

RUN apt-get update

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev

RUN docker-php-ext-install gd pdo_mysql pdo_pgsql
