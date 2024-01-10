ARG ARCH=amd64
FROM sykescottages/php:7.0-fpm-$ARCH

RUN apt-get update && \
    apt-get install -y \
    php7.0-mysql \
    php7.0-mcrypt \
    php7.0-gd \
    php7.0-ldap \
    php7.0-amqp \
    php7.0-redis

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
