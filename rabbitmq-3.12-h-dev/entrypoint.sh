#!/usr/bin/env bash

docker-entrypoint.sh rabbitmq-server &

while ! rabbitmqadmin -H localhost import /setup.json 2>/dev/null; do
    sleep 2
done

wait
