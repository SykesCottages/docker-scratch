ARG ARCH=amd64
FROM sykescottages/php:7.0-cli-$ARCH

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq update && \
    apt-get -qq install -y \
    php7.0-mysql \
    php7.0-mcrypt \
    php7.0-gd \
    php7.0-ldap \
    php7.0-amqp \
    mysql-client

COPY --from=composer:1 /usr/bin/composer /usr/bin/composer

COPY ./php.ini /etc/php/7.0/cli/

ENV DOCKER=1