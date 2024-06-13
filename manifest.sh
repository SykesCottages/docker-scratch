#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker login >>/dev/null 2>&1

VERSIONS=(
  "node-10-k-dev"
  "node-12-e-dev"
  "node-14-k-dev"
  "node-18-h-dev"
  "php-5.6-fpm-e-dev"
  "php-5.6-fpm-t-dev"
  "php-7.0-cli-h-dev"
  "php-7.0-fpm-h"
  "php-7.0-fpm-h-dev"
  "php-7.0-supervisor-h-dev"
  "php-7.3-fpm-k-dev"
  "php-8.3-cli-e"
  "php-8.3-fpm-p"
  "php-8.3-fpm-t-dev"
  "rabbitmq-3.12"
  "ruby-3-fake-s3"
  "ruby-3-fake-sqs"
)

for VERSION in "${VERSIONS[@]}"
do
  TAG="sykescottages/scratch:$VERSION"
  docker manifest rm $TAG
  docker manifest create $TAG \
    --amend "$TAG-amd64" \
    --amend "$TAG-arm64"
  docker manifest push $TAG
done
