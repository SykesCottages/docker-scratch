ARG ARCH=amd64
FROM sykescottages/php:5.6-fpm-$ARCH

RUN apt-get update && apt-get install -y \
    php5.6-ldap \
    php5.6-redis \
    php5.6-gd \
    php5.6-mcrypt \
    php5.6-memcache \
    php5.6-imap \
    php5.6-mailparse \
    php-pear \
    librabbitmq-dev \
    libmcrypt-dev

RUN printf "\n" | pecl install amqp-1.11.0 && \
    echo "extension=amqp.so" > /etc/php/5.6/mods-available/amqp.ini && \
    ln -s /etc/php/5.6/mods-available/amqp.ini /etc/php/5.6/cli/conf.d/20-amqp.ini && \
    ln -s /etc/php/5.6/mods-available/amqp.ini /etc/php/5.6/fpm/conf.d/20-amqp.ini

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*