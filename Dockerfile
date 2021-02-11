FROM composer:1.9.3 as vendor

WORKDIR /tmp/

COPY composer.json ./
COPY composer.lock ./

RUN composer install 


FROM php:7.2-apache-stretch

COPY . /var/www/html
COPY --from=vendor /tmp/vendor/ /var/www/html/vendor/
