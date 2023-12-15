#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker login >>/dev/null 2>&1

VERSIONS=( "php-5.6-fpm-e-dev" "node-12-e-dev" )
for VERSION in "${VERSIONS[@]}"
do
  TAG="sykescottages/scratch:$VERSION"
  docker manifest create $TAG \
    --amend "$TAG-amd64" \
    --amend "$TAG-arm64"
  docker manifest push $TAG
done
