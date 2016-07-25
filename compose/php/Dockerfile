FROM php:5.5-fpm

RUN apt-get update

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libfreetype6-dev libjpeg62-turbo-dev  libjpeg-dev libpq-dev php5-gd

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
  
RUN docker-php-ext-install mysql mysqli gd pdo_mysql pdo_pgsql
