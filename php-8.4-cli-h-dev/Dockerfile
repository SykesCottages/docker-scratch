ARG ARCH=amd64
FROM sykescottages/php:8.4-cli-$ARCH

RUN apt-get update && \
    apt install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible

RUN apt-get update && \
    apt-get install -y \
        php8.4-mysql \
        php8.4-mcrypt \
        php8.4-gd \
        php8.4-ldap \
        php8.4-amqp \
        mysql-client \
        supervisor \
        ansible \
        wget

RUN wget -q https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.8.4/bin/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin && \
    chmod +x /usr/local/bin/rabbitmqadmin

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
