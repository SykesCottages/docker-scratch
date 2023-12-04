#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker login >> /dev/null 2>&1

VERSIONS=($(find . -type d -regex '\./[a-z].+' | sort | sed 's/\.\///'))
for VERSION in "${VERSIONS[@]}"; do
  TAG="sykescottages/cdk:${VERSION}"
  docker manifest create $TAG \
    --amend "$TAG-amd64" \
    --amend "$TAG-arm64"
  docker manifest push $TAG
done
