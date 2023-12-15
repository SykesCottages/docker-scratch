#!/bin/bash

VERSION=$1

TAG="sykescottages/scratch:${VERSION}"
docker build --quiet --no-cache -t $TAG $VERSION
docker push $TAG
