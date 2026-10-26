#!/bin/bash

ARCH=$(arch)

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

if [ "x86_64" == "$ARCH" ]; then
  ARCH=amd64
elif [ "aarch64" == "$ARCH" ] || [ "arm64" == "$ARCH" ]; then
  ARCH=arm64
else
  echo "Architecture ${ARCH} not supported."
  exit 1
fi

VERSIONS=(
  "node-10-k-dev"
  "node-12-e-dev"
  "node-14-k-dev"
  "node-18-h-dev"
  "php-8.3-cli-e"
  "php-8.3-fpm-e"
  "php-8.3-fpm-p"
  "php-8.3-fpm-t-dev"
  "php-8.3-cli-h-dev"
  "php-8.3-fpm-h"
  "php-8.3-fpm-h-dev"
  "php-8.3-supervisor-h-dev"
  "php-8.4-cli-h-dev"
  "php-8.4-fpm-h"
  "php-8.4-fpm-h-dev"
  "php-8.4-supervisor-h-dev"
  "php-8.4-mysql"
  "php-8.4-cli-e"
  "php-8.4-fpm-e"
  "rabbitmq-3.12"
  "ruby-3-fake-s3"
  "ruby-3-fake-sqs"
  "mysql-8"
)

for VERSION in "${VERSIONS[@]}"
do
  ./build_multiarch.sh $VERSION $ARCH >> /dev/null 2>&1 &
done

wait
