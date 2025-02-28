ARG ARCH=amd64
FROM sykescottages/php:8.3-cli-$ARCH

RUN apt-get update && \
    apt install software-properties-common -y && \
    apt-add-repository --yes --update ppa:ansible/ansible

RUN apt-get update && \
    apt-get install -y \
    php8.3-mysql \
    php8.3-mcrypt \
    php8.3-gd \
    php8.3-ldap \
    php8.3-amqp \
    mysql-client \
    supervisor \
    ansible \
    wget

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.8.4/bin/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin && \
    chmod +x /usr/local/bin/rabbitmqadmin
