#!/bin/bash

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

VERSIONS=(
  "php-8.3-cli-t"
  "php-8.3-fpm-t"
  "jq"
)

for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION >> /dev/null 2>&1 &
done

wait
