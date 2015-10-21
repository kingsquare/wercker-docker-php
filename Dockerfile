FROM php:5.6-cli
MAINTAINER Kingsquare <docker@kingsquare.nl>

ENV TZ "Europe/Amsterdam"

RUN apt-get update && \
    apt-get install -qy --no-install-recommends \
        libmcrypt-dev \
        libbz2-dev \
        zlib1g-dev \
        curl \
        git \
        && \
    docker-php-ext-install mcrypt zip bz2 mbstring && \
    echo "date.timezone = $TZ" > /usr/local/etc/php/conf.d/timezone.ini && \
    echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    curl -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && \
    chmod +x /usr/local/bin/phpunit
