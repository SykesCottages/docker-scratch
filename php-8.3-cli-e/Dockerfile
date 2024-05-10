ARG ARCH=amd64
FROM sykescottages/php:8.3-cli-$ARCH

RUN apt-get update && \
    apt-get install -y \
        php8.3-ldap \
        php8.3-redis \
        php8.3-gd \
        php8.3-memcache \
        php8.3-mcrypt \
        php8.3-imap \
        php8.3-mailparse \
        php-pear \
        librabbitmq-dev \
        libmcrypt-dev \
        cron \
        supervisor \
        wget

# New Relic
RUN curl -L "https://download.newrelic.com/php_agent/archive/10.18.0.8/newrelic-php5-10.18.0.8-linux.tar.gz" | tar -C /tmp -zx && \
   export NR_INSTALL_USE_CP_NOT_LN=1 && \
   export NR_INSTALL_SILENT=1 && \
   /tmp/newrelic-php5-*/newrelic-install install && \
   rm -rf /tmp/newrelic-php5-* /tmp/nrinstall* && \
   mv /etc/php/8.3/cli/conf.d/newrelic.ini /etc/php/8.3/mods-available/newrelic.ini && \
   ln -s /etc/php/8.3/mods-available/newrelic.ini /etc/php/8.3/cli/conf.d/20-newrelic.ini

# Install AMQP
RUN pecl install amqp && \
    echo "extension=amqp.so" > /etc/php/8.3/mods-available/amqp.ini && \
    ln -s /etc/php/8.3/mods-available/amqp.ini /etc/php/8.3/cli/conf.d/20-amqp.ini

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*