ARG ARCH=amd64
FROM sykescottages/php:7.0-fpm-$ARCH

RUN apt-get update && \
    apt-get install -y \
    php7.0-mysql \
    php7.0-mcrypt \
    php7.0-gd \
    php7.0-ldap \
    php7.0-amqp \
    php7.0-redis \
    libmcrypt-dev \
    zlib1g-dev \
    libonig-dev \
    jq

RUN curl -L "https://download.newrelic.com/php_agent/archive/10.19.0.9/newrelic-php5-10.19.0.9-linux.tar.gz" | tar -C /tmp -zx

RUN export NR_INSTALL_USE_CP_NOT_LN=1 \
      && export NR_INSTALL_SILENT=1 \
      && /tmp/newrelic-php5-*/newrelic-install install \
      && rm -rf /tmp/newrelic-php5-* /tmp/nrinstall*

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
