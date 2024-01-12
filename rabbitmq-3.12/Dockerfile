FROM rabbitmq:3.12-management-alpine

RUN apk update && \
    apk add \
        python3 \
        openssl

RUN wget -O /opt/rabbitmq/sbin/rabbitmqadmin \
        https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.12.x/deps/rabbitmq_management/bin/rabbitmqadmin && \
    chmod +x /opt/rabbitmq/sbin/rabbitmqadmin

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
