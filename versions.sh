#!/bin/bash

VERSIONS=($(find . -type d -regex '\./[a-z].+' | sort | sed 's/\.\///'))

for VERSION in "${VERSIONS[@]}"
do
  docker run -it --entrypoint /bin/bash --rm sykescottages/scratch:${VERSION} -c "apt -qq list | tail -n+2" | tail -n+4 > $VERSION/aptitude-itinerary
done
