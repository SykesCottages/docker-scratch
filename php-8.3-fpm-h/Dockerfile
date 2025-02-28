ARG ARCH=amd64
FROM sykescottages/php:8.3-fpm-$ARCH

RUN apt-get update && \
    apt-get install -y \
    php8.3-mysql \
    php8.3-mcrypt \
    php8.3-gd \
    php8.3-ldap \
    php8.3-amqp \
    php8.3-redis \
    libmcrypt-dev \
    zlib1g-dev \
    libonig-dev \
    jq

RUN curl -L "https://download.newrelic.com/php_agent/archive/10.18.0.8/newrelic-php5-10.18.0.8-linux.tar.gz" | tar -C /tmp -zx

RUN export NR_INSTALL_USE_CP_NOT_LN=1 \
      && export NR_INSTALL_SILENT=1 \
      && /tmp/newrelic-php5-*/newrelic-install install \
      && rm -rf /tmp/newrelic-php5-* /tmp/nrinstall*

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
