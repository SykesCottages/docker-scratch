#!/bin/bash

VERSION=$1

docker build --no-cache -t sykescottages/scratch:$VERSION $VERSION
docker push sykescottages/scratch:${VERSION}
docker rmi sykescottages/scratch:${VERSION}