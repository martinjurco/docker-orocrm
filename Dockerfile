FROM php:7-apache

MAINTAINER Ondrej Sika <ondrej@ondrejsika.com>

RUN apt-get update && \
    apt-get install -y wget libicu-dev libmcrypt-dev libpng12-dev && \
    docker-php-ext-install intl mysqli pdo pdo_mysql mcrypt gd && \
    cd / && \
    wget -c https://drive.ondrejsika.com/orocrm/10.0.0/crm-application.tar.gz && \
    tar -xzvf crm-application.tar.gz && \
    mv crm-application /orocrm && \
    rm /etc/apache2/sites-enabled/* && \
    chmod -R 777 /orocrm/app/cache && \
    chown www-data:www-data /orocrm -R

COPY apache.conf /etc/apache2/sites-enabled/
COPY php.ini /usr/local/etc/php/

VOLUME /orocrm/app/attachment
VOLUME /orocrm/app/config

VOLUME /orocrm/app/cache

