ARG ARCH=amd64
FROM sykescottages/php:8.4-cli-$ARCH

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq update && \
    apt-get -qq install -y \
    php8.4-mysql \
    php8.4-mcrypt \
    php8.4-gd \
    php8.4-ldap \
    php8.4-amqp \
    mysql-client

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY ./php.ini /etc/php/8.4/cli/

ENV DOCKER=1