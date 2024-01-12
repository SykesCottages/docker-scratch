#!/usr/bin/env sh

set -e

if [ $# -gt 0 ]; then
    $@
    exit
fi

if [ ! -z "$SQS_DATABASE" ]; then
  DATABASE="--database $SQS_DATABASE"
fi

if [ ! -z "$SQS_PORT" ]; then
  PORT="--port $SQS_PORT"
fi

if [ ! -z "$SQS_HOST" ]; then
  HOST="--bind $SQS_HOST"
fi

if [ ! -z "$SQS_SERVER" ]; then
  SERVER="--server $SQS_SERVER"
fi

if [ ! -z "$SQS_PID" ]; then
  PID="--pid $SQS_PID"
fi

if [ ! -z "$SQS_LOG" ]; then
  LOG="--log $SQS_LOG"
fi

fake_sqs $DATABASE $HOST $PORT $SERVER $PID $LOG $@