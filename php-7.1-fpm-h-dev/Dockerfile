ARG ARCH=amd64
FROM sykescottages/php:7.1-fpm-$ARCH

RUN apt-get update && \
    apt-get install -y \
    php7.1-mysql \
    php7.1-mcrypt \
    php7.1-gd \
    php7.1-ldap \
    php7.1-amqp \
    php7.1-redis

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
