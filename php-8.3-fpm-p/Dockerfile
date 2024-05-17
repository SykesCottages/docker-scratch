ARG ARCH=amd64
FROM sykescottages/php:8.3-fpm-$ARCH

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
        php8.3-redis

# Cleanup
RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*

# New Relic
RUN curl -L "https://download.newrelic.com/php_agent/archive/10.20.0.10/newrelic-php5-10.20.0.10-linux.tar.gz" | tar -C /tmp -zx && \
   export NR_INSTALL_USE_CP_NOT_LN=1 && \
   export NR_INSTALL_SILENT=1 && \
   /tmp/newrelic-php5-*/newrelic-install install && \
   rm -rf /tmp/newrelic-php5-* /tmp/nrinstall* && \
   mv /etc/php/8.3/cli/conf.d/newrelic.ini /etc/php/8.3/mods-available/newrelic.ini && \
   rm -rf /etc/php/8.3/fpm/conf.d/newrelic.ini && \
   ln -s /etc/php/8.3/mods-available/newrelic.ini /etc/php/8.3/cli/conf.d/20-newrelic.ini && \
   ln -s /etc/php/8.3/mods-available/newrelic.ini /etc/php/8.3/fpm/conf.d/20-newrelic.ini \
