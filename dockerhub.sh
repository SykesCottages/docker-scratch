#!/bin/bash

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

VERSIONS=(
  "php-7.0-mysql"
  "php-7.3-fpm-k"
  "php-5.6-fpm-e"
  "php-5.6-cli-e"
  "php-5.6-cli-t"
  "php-5.6-fpm-t"
  "php-8.3-cli-t"
  "php-8.3-fpm-t"
  "jq"
)

for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION >> /dev/null 2>&1 &
done

wait
