#!/usr/bin/env sh

set -e

if [ $# -gt 0 ]; then
    $@
    exit
fi

SET_S3_PATH=/fakes3
PORT=4569
LICENSE=test

if [ ! -z "$S3_PATH" ]; then
  $SET_S3_PATH="-r $S3_PATH"
fi

if [ ! -z "$S3_PORT" ]; then
  PORT="-p $S3_PORT"
fi

if [ ! -z "$S3_PORT" ]; then
  PORT="-p $S3_PORT"
fi

mkdir -p $SET_S3_PATH

fakes3 -r $SET_S3_PATH -p $PORT $@
