FROM php:7.4-apache

RUN mkdir /app && \
    chown www-data:www-data /app
WORKDIR /app

COPY site.conf /etc/apache2/sites-available

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        graphviz \
        libbz2-dev && \
    docker-php-source extract && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install ctype && \
    docker-php-ext-install json && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install pdo && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install zip && \
    docker-php-ext-install bz2 && \
    docker-php-ext-install tokenizer && \
    docker-php-ext-install xml && \
    docker-php-ext-install soap && \
    a2enmod rewrite && \
    a2ensite site && \
    a2dissite 000-default && \
    rm -rf /var/lib/apt/lists/*
