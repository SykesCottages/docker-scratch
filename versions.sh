#!/bin/bash

VERSIONS=($(find . -type d -regex '\./[a-z].+' | sort | sed 's/\.\///'))

for VERSION in "${VERSIONS[@]}"
do
  docker run -it sykescottages/scratch:${VERSION} bash -c "apt -qq list | tail -n+2" | tail -n+4 > $VERSION/aptitude-itinerary
done
