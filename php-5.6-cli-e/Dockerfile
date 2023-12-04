ARG ARCH=amd64
FROM sykescottages/php:5.6-cli-$ARCH

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
        php5.6-ldap \
        php5.6-redis \
        php5.6-gd \
        php5.6-mcrypt \
        php-pear \
        librabbitmq-dev \
        libmcrypt-dev \
        libmcrypt-dev \
        libxrender1 \
        libfontconfig \
        libxtst6 \
        xz-utils \
        cron \
        supervisor \
        wget

# New Relic
RUN curl -L "https://download.newrelic.com/php_agent/archive/10.11.0.3/newrelic-php5-10.11.0.3-linux.tar.gz" | tar -C /tmp -zx && \
   export NR_INSTALL_USE_CP_NOT_LN=1 && \
   export NR_INSTALL_SILENT=1 && \
   /tmp/newrelic-php5-*/newrelic-install install && \
   rm -rf /tmp/newrelic-php5-* /tmp/nrinstall* && \
   mv /etc/php/5.6/cli/conf.d/newrelic.ini /etc/php/5.6/mods-available/newrelic.ini && \
   ln -s /etc/php/5.6/mods-available/newrelic.ini /etc/php/5.6/cli/conf.d/20-newrelic.ini

# Install PHP Unit
RUN curl -L https://phar.phpunit.de/phpunit-7.phar > /usr/local/bin/phpunit && \
    echo "079d70e7e6496c7f50ce3040613fc85fa2331b0309170e4e8a23fc512795228b7ad7c924de29e6b7dccc0513fceda405 /usr/local/bin/phpunit" | sha384sum --check && \
    chmod +x /usr/local/bin/phpunit

# WK HTML to PDF
RUN curl https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz -LJO && \
    tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
    cp wkhtmltox/bin/wk* /usr/local/bin/ && \
    mv /usr/local/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf-amd64

# Install AMQP
RUN printf "\n" | pecl install amqp-1.11.0 && \
    echo "extension=amqp.so" > /etc/php/5.6/mods-available/amqp.ini && \
    ln -s /etc/php/5.6/mods-available/amqp.ini /etc/php/5.6/cli/conf.d/20-amqp.ini

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
