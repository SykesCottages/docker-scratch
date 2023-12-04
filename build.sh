#!/bin/bash

VERSION=$1

TAG="sykescottages/scratch:${VERSION}"
docker build --quiet --no-cache -t $TAG --build-arg $VERSION
docker push $TAG
