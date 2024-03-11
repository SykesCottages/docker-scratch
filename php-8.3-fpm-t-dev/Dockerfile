ARG ARCH=amd64
FROM sykescottages/php:8.3-fpm-$ARCH

RUN apt-get update && apt-get install -y \
    php8.3-ldap \
    php8.3-redis \
    php8.3-gd \
    php8.3-memcache \
    php8.3-imap \
    php8.3-mailparse \
    php-pear \
    librabbitmq-dev \
    libmcrypt-dev

# Install AMQP
RUN pecl install amqp && \
    echo "extension=amqp.so" > /etc/php/8.3/mods-available/amqp.ini && \
    ln -s /etc/php/8.3/mods-available/amqp.ini /etc/php/8.3/cli/conf.d/20-amqp.ini && \
    ln -s /etc/php/8.3/mods-available/amqp.ini /etc/php/8.3/fpm/conf.d/20-amqp.ini

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*