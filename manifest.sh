#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker login >>/dev/null 2>&1

VERSIONS=( "php-7.0-cli-h-dev" "php-7.0-fpm-h-dev" "php-7.0-supervisor-h-dev" "rabbitmq-3.12-h-dev" "ruby-2-fake-sqs-h-dev" "node-18-h-dev" "php-5.6-fpm-t-dev" "php-5.6-fpm-e-dev" "node-12-e-dev" )
for VERSION in "${VERSIONS[@]}"
do
  TAG="sykescottages/scratch:$VERSION"
  docker manifest create $TAG \
    --amend "$TAG-amd64" \
    --amend "$TAG-arm64"
  docker manifest push $TAG
done
