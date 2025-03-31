ARG ARCH=amd64
FROM sykescottages/php:8.4-fpm-$ARCH

RUN apt-get update && \
    apt-get install -y \
    php8.4-mysql \
    php8.4-mcrypt \
    php8.4-gd \
    php8.4-ldap \
    php8.4-amqp \
    php8.4-redis \
    libmcrypt-dev \
    zlib1g-dev \
    libonig-dev \
    jq

RUN curl -L "https://download.newrelic.com/php_agent/archive/11.7.0.21/newrelic-php5-11.7.0.21-linux.tar.gz" | tar -C /tmp -zx

RUN export NR_INSTALL_USE_CP_NOT_LN=1 \
      && export NR_INSTALL_SILENT=1 \
      && /tmp/newrelic-php5-*/newrelic-install install \
      && rm -rf /tmp/newrelic-php5-* /tmp/nrinstall*

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
