FROM php:7.0-apache

MAINTAINER m03r932
ENV UNMARK_VERSION=1.9.2

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y git && \
    a2enmod rewrite && \
    docker-php-ext-install -j$(nproc) gettext mysqli && \
    git clone https://github.com/plainmade/unmark /var/www/html && \
    git checkout v${UNMARK_VERSION} && \
    apt-get remove --purge -y git && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
