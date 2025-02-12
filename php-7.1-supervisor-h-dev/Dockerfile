ARG ARCH=amd64
FROM sykescottages/php:7.1-cli-$ARCH

RUN apt-get update && \
    apt install software-properties-common -y && \
    apt-add-repository --yes --update ppa:ansible/ansible

RUN apt-get update && \
    apt-get install -y \
    php7.1-mysql \
    php7.1-mcrypt \
    php7.1-gd \
    php7.1-ldap \
    php7.1-amqp \
    mysql-client \
    supervisor \
    ansible \
    wget

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
