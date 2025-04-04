#!/bin/sh

itShouldCheckThatAllInstalledSoftwareExists() {
    doesCommandExist ruby
    doesCommandExist fake_sqs
}

doesCommandExist() {
    if ! [ -x "$(command -v $1)" ]; then
      echo "Error: $1 is not installed." >&2
      exit 1
    else
      echo "$1 Command Exists"
    fi
}

itShouldCheckThatAllInstalledSoftwareExists
