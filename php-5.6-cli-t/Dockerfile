FROM sykescottages/php:5.6-cli

RUN apt-get update && \
    apt-get install -y \
        php5.6-ldap \
        php5.6-redis \
        php5.6-gd \
        php5.6-memcache \
        php5.6-imap \
        php5.6-mailparse \
        php-pear \
        librabbitmq-dev \
        libmcrypt-dev \
        cron \
        supervisor \
        wget

# New Relic
RUN curl -L "https://download.newrelic.com/php_agent/archive/10.11.0.3/newrelic-php5-10.11.0.3-linux.tar.gz" | tar -C /tmp -zx && \
   export NR_INSTALL_USE_CP_NOT_LN=1 && \
    export NR_INSTALL_SILENT=1 && \
     /tmp/newrelic-php5-*/newrelic-install install && \
      rm -rf /tmp/newrelic-php5-* /tmp/nrinstall*

RUN curl -L https://phar.phpunit.de/phpunit-7.phar > /usr/local/bin/phpunit && \
    echo "079d70e7e6496c7f50ce3040613fc85fa2331b0309170e4e8a23fc512795228b7ad7c924de29e6b7dccc0513fceda405 /usr/local/bin/phpunit" | sha384sum --check && \
    chmod +x /usr/local/bin/phpunit

RUN printf "\n" | pecl install amqp-1.11.0 && \
    echo "extension=amqp.so" > /etc/php/5.6/cli/conf.d/amqp.ini;
