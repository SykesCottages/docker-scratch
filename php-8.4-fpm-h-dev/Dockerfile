ARG ARCH=amd64
FROM sykescottages/php:8.4-fpm-$ARCH

RUN apt-get update && \
    apt-get install -y \
    php8.4-mysql \
    php8.4-mcrypt \
    php8.4-gd \
    php8.4-ldap \
    php8.4-amqp \
    php8.4-redis

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
