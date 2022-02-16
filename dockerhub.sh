#!/bin/bash

BRANCHES=( "php-7.0-mysql" "php-7.3-fpm-k" "php-5.6-fpm-e" "php-5.6-cli-e" "php-5.6-cli-t" "php-5.6-fpm-t" )

for BRANCH in "${BRANCHES[@]}"
do
  git checkout $BRANCH
  docker build --no-cache -t sykescottages/scratch:$BRANCH .
  docker push sykescottages/scratch:${BRANCH}
  docker rmi sykescottages/scratch:${BRANCH}
done

git checkout main