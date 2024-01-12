#!/bin/bash

ARCH=$(arch)

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

if [ "x86_64" == "$ARCH" ]; then
  ARCH=amd64
elif [ "aarch64" == "$ARCH" ]; then
  ARCH=arm64
else
  echo "Architecture ${ARCH} not supported."
  exit 1
fi

VERSIONS=( "php-7.0-cli-h-dev" "php-7.0-fpm-h-dev" "php-7.0-supervisor-h-dev" "rabbitmq-3.12" "ruby-3-fake-sqs" "ruby-3-fake-s3" "node-18-h-dev" "php-5.6-fpm-t-dev" "php-5.6-fpm-e-dev" "node-12-e-dev" )
for VERSION in "${VERSIONS[@]}"
do
  ./build_multiarch.sh $VERSION $ARCH >> /dev/null 2>&1 &
done

wait
