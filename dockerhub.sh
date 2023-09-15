#!/bin/bash

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

VERSIONS=($(find . -type d -regex '\./[a-z].+' | sort | sed 's/\.\///'))

for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION >> /dev/null 2>&1 &
done

wait
