ARG ARCH=amd64
FROM sykescottages/php:7.3-fpm-$ARCH

RUN apt-get -qq update && \
    apt-get -qq install -y \
    libmcrypt-dev \
    libmemcached-dev \
    zlib1g-dev \
    php7.3-memcached \
    php7.3-mbstring \
    php7.3-mysqli \
    php7.3-curl \
    php7.3-intl \
    php7.3-opcache \
    php7.3-zip \
    php7.3-soap \
    php7.3-bcmath \
    php7.3-sockets \
    mysql-client

RUN pecl install mcrypt-1.0.2
RUN pecl install redis-5.3.7

RUN echo "extension=mcrypt.so" > /etc/php/7.3/mods-available/mcrypt.ini
RUN echo "extension=redis.so" > /etc/php/7.3/mods-available/redis.ini

RUN ln -s /etc/php/7.3/mods-available/mcrypt.ini /etc/php/7.3/cli/conf.d/20-mcrypt.ini; \
    ln -s /etc/php/7.3/mods-available/mcrypt.ini /etc/php/7.3/fpm/conf.d/20-mcrypt.ini; \
    ln -s /etc/php/7.3/mods-available/mcrypt.ini /etc/php/7.3/apache2/conf.d/20-mcrypt.ini;

RUN ln -s /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/cli/conf.d/20-redis.ini; \
    ln -s /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/fpm/conf.d/20-redis.ini; \
    ln -s /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/apache2/conf.d/20-redis.ini;

RUN curl -L "https://download.newrelic.com/php_agent/archive/9.2.0.247/newrelic-php5-9.2.0.247-linux.tar.gz" | tar -C /tmp -zx && \
   export NR_INSTALL_USE_CP_NOT_LN=1 && \
    export NR_INSTALL_SILENT=1 && \
     /tmp/newrelic-php5-*/newrelic-install install && \
      rm -rf /tmp/newrelic-php5-* /tmp/nrinstall*
