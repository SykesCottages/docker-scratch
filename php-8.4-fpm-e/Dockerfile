ARG ARCH=amd64
FROM sykescottages/php:8.4-fpm-$ARCH

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
        php8.4-ldap \
        php8.4-redis \
        php8.4-pspell \
        php8.4-gd \
        php8.4-mcrypt \
        php-pear \
        librabbitmq-dev \
        libmcrypt-dev \
        libmcrypt-dev \
        libxrender1 \
        libfontconfig \
        libxtst6 \
        xz-utils \
        wget

# New Relic
RUN curl -L "https://download.newrelic.com/php_agent/archive/12.1.0.26/newrelic-php5-12.1.0.26-linux.tar.gz" | tar -C /tmp -zx && \
   export NR_INSTALL_USE_CP_NOT_LN=1 && \
   export NR_INSTALL_SILENT=1 && \
   /tmp/newrelic-php5-*/newrelic-install install && \
   rm -rf /tmp/newrelic-php5-* /tmp/nrinstall* && \
   mv /etc/php/8.4/cli/conf.d/newrelic.ini /etc/php/8.4/mods-available/newrelic.ini && \
   rm -rf /etc/php/8.4/fpm/conf.d/newrelic.ini && \
   ln -s /etc/php/8.4/mods-available/newrelic.ini /etc/php/8.4/cli/conf.d/20-newrelic.ini && \
   ln -s /etc/php/8.4/mods-available/newrelic.ini /etc/php/8.4/fpm/conf.d/20-newrelic.ini

# WK HTML to PDF
RUN curl https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz -LJO && \
    tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
    cp wkhtmltox/bin/wk* /usr/local/bin/ && \
    mv /usr/local/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf-amd64

# Install AMQP
RUN pecl install amqp && \
    echo "extension=amqp.so" > /etc/php/8.4/mods-available/amqp.ini && \
    ln -s /etc/php/8.4/mods-available/amqp.ini /etc/php/8.4/cli/conf.d/20-amqp.ini && \
    ln -s /etc/php/8.4/mods-available/amqp.ini /etc/php/8.4/fpm/conf.d/20-amqp.ini

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*