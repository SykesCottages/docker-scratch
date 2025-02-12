ARG ARCH=amd64
FROM sykescottages/php:8.3-fpm-$ARCH

RUN apt-get update && \
    apt-get install -y \
    php8.3-mysql \
    php8.3-mcrypt \
    php8.3-gd \
    php8.3-ldap \
    php8.3-amqp \
    php8.3-redis

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
