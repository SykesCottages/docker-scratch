#!/bin/bash

BRANCHES=( "php-5.6-fpm-t" )

for BRANCH in "${BRANCHES[@]}"
do
  git checkout $BRANCH
  docker build --no-cache -t sykescottages/scratch:$BRANCH .
  docker push sykescottages/scratch:${BRANCH}
  docker rmi sykescottages/scratch:${BRANCH}
done

git checkout main