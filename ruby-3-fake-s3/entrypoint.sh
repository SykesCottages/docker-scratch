#!/usr/bin/env sh

set -e

if [ $# -gt 0 ]; then
    $@
    exit
fi

PATH=/fakes3
PORT=4569

if [ ! -z "$S3_PATH" ]; then
  PATH="-r $S3_PATH"
fi

if [ ! -z "$S3_PORT" ]; then
  PORT="-p $S3_PORT"
fi

RUN mkdir -p $PATH

fakes3 -r $PATH -p $PORT $@