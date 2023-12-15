#!/bin/bash

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

VERSIONS=( "php-5.6-fpm-e-dev" "node-12-e-dev" )
for VERSION in "${VERSIONS[@]}"
do
  ./build_multiarch.sh $VERSION $ARCH >> /dev/null 2>&1 &
done

wait
