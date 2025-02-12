ARG ARCH=amd64
FROM sykescottages/php:7.1-cli-$ARCH

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq update && \
    apt-get -qq install -y \
    php7.1-mysql \
    php7.1-mcrypt \
    php7.1-gd \
    php7.1-ldap \
    php7.1-amqp \
    mysql-client

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY ./php.ini /etc/php/7.1/cli/

ENV DOCKER=1