FROM sykescottages/php:5.6-fpm

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
        php5.6-ldap \
        php5.6-redis \
        php5.6-gd \
        php5.6-memcache \
        php-pear \
        librabbitmq-dev \
        libmcrypt-dev

# Install PHP Unit
RUN curl -L https://phar.phpunit.de/phpunit-7.phar > /usr/local/bin/phpunit && \
    echo "079d70e7e6496c7f50ce3040613fc85fa2331b0309170e4e8a23fc512795228b7ad7c924de29e6b7dccc0513fceda405 /usr/local/bin/phpunit" | sha384sum --check && \
    chmod +x /usr/local/bin/phpunit

# Install AMQP
RUN pecl install amqp && \
    echo "extension=amqp.so" > /etc/php/5.6/fpm/conf.d/amqp.ini && \
    echo "extension=amqp.so" > /etc/php/5.6/cli/conf.d/amqp.ini

# Enable Pool Error Logs
RUN sed -i 's|;catch_workers_output = yes|catch_workers_output = yes|g' /etc/php/5.6/fpm/pool.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /etc/php/5.6/fpm/pool.d/www.conf
RUN echo "php_admin_flag[display_errors] = off" >> /etc/php/5.6/fpm/pool.d/www.conf
RUN echo "php_admin_value[error_reporting] = E_ALL & ~E_NOTICE & ~E_WARNING & ~E_STRICT & ~E_DEPRECATED" >> /etc/php/5.6/fpm/pool.d/www.conf
RUN echo "php_admin_value[error_log] = /dev/stderr" >> /etc/php/5.6/fpm/pool.d/www.conf

# Enable FPM Logs
RUN echo "error_log = /dev/stderr" >> /etc/php/5.6/fpm/php.ini

# Timeout requests that take longer than 30 seconds
RUN echo "request_terminate_timeout = 30" >> /etc/php/5.6/fpm/pool.d/www.conf

# Log Access Logs
#RUN sed -i 's|access.log =.*|access.log = /dev/stdout|g' /etc/php/5.6/fpm/pool.d/www.conf

# Boost the FPM Pool Size
RUN sed -i 's|pm.max_children = [0-9]+|pm.max_children = 5|g' /etc/php/5.6/fpm/pool.d/www.conf
RUN sed -i 's|pm.start_servers = [0-9]+|pm.start_servers = 2|g' /etc/php/5.6/fpm/pool.d/www.conf
RUN sed -i 's|pm.min_spare_servers = [0-9]+|pm.min_spare_servers = 1|g' /etc/php/5.6/fpm/pool.d/www.conf
RUN sed -i 's|pm.max_spare_servers = [0-9]+|pm.max_spare_servers = 3|g' /etc/php/5.6/fpm/pool.d/www.conf
