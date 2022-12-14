FROM sykescottages/php:5.6-fpm

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
        php5.6-ldap \
        php5.6-redis \
        php5.6-pspell \
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
        wget

# New Relic
RUN echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
RUN wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -

RUN apt-get update && \
    apt-get install -y newrelic-php5

# Install PHP Unit
RUN curl -L https://phar.phpunit.de/phpunit-7.phar > /usr/local/bin/phpunit && \
    echo "079d70e7e6496c7f50ce3040613fc85fa2331b0309170e4e8a23fc512795228b7ad7c924de29e6b7dccc0513fceda405 /usr/local/bin/phpunit" | sha384sum --check && \
    chmod +x /usr/local/bin/phpunit

# WK HTML to PDF
RUN curl https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz -LJO && \
    tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
    cp wkhtmltox/bin/wk* /usr/local/bin/ && \
    mv /usr/local/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf-amd64 \

# Install AMQP
RUN pecl install amqp && \
    echo "extension=amqp.so" > /etc/php/5.6/fpm/conf.d/amqp.ini && \
    echo "extension=amqp.so" > /etc/php/5.6/cli/conf.d/amqp.ini

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
