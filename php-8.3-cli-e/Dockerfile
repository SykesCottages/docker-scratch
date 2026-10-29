ARG ARCH=amd64
FROM sykescottages/php:8.3-cli-$ARCH

RUN apt-get update && \
    apt-get install -y \
        php8.3-ldap \
        php8.3-redis \
        php8.3-gd \
        php8.3-mcrypt \
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
RUN curl -L "https://download.newrelic.com/php_agent/archive/12.12.0.41/newrelic-php5-12.12.0.41-linux.tar.gz" | tar -C /tmp -zx && \
   export NR_INSTALL_USE_CP_NOT_LN=1 && \
   export NR_INSTALL_SILENT=1 && \
   /tmp/newrelic-php5-*/newrelic-install install && \
   rm -rf /tmp/newrelic-php5-* /tmp/nrinstall* 

# WK HTML to PDF
RUN curl https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz -LJO && \
    tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
    cp wkhtmltox/bin/wk* /usr/local/bin/ && \
    mv /usr/local/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf-amd64

# Install AMQP
RUN pecl install amqp && \
    echo "extension=amqp.so" > /etc/php/8.3/mods-available/amqp.ini && \
    ln -s /etc/php/8.3/mods-available/amqp.ini /etc/php/8.3/cli/conf.d/20-amqp.ini

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
