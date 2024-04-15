ARG ARCH=amd64
FROM sykescottages/php:7.3-fpm-$ARCH

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    php7.3-memcached \
    php7.3-amqp

RUN pecl install mcrypt-1.0.2
RUN pecl install redis-5.3.7

RUN echo "extension=mcrypt.so" > /etc/php/7.3/mods-available/mcrypt.ini
RUN echo "extension=redis.so" > /etc/php/7.3/mods-available/redis.ini

RUN ln -s /etc/php/7.3/mods-available/mcrypt.ini /etc/php/7.3/cli/conf.d/20-mcrypt.ini && \
    ln -s /etc/php/7.3/mods-available/mcrypt.ini /etc/php/7.3/fpm/conf.d/20-mcrypt.ini

RUN ln -s /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/cli/conf.d/20-redis.ini && \
    ln -s /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/fpm/conf.d/20-redis.ini

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/* \
