#!/bin/bash

# You need to provide your own creds because #security
docker login

VERSIONS=( "php-7.0-mysql" "php-7.3-fpm-k" "php-5.6-fpm-e" "php-5.6-cli-e" "php-5.6-cli-t" "php-5.6-fpm-t" "jq" )

for VERSION in "${VERSIONS[@]}"
do
  docker build --no-cache -t sykescottages/scratch:$VERSION $VERSION
  docker push sykescottages/scratch:${VERSION}

  docker rmi sykescottages/scratch:${VERSION}
done
