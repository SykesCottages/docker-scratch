#!/bin/sh

PHP_VERSION=8.3

itShouldCheckThatAllInstalledSoftwareExists() {
    doesCommandExist php
    doesCommandExist composer
}

itShouldCheckThatAllPhpModulesExists() {
  doesPhpModuleExist amqp
  doesPhpModuleExist bcmath
  doesPhpModuleExist curl
  doesPhpModuleExist date
  doesPhpModuleExist gd
  doesPhpModuleExist intl
  doesPhpModuleExist imap
  doesPhpModuleExist json
  doesPhpModuleExist ldap
  doesPhpModuleExist mbstring
  doesPhpModuleExist mailparse
  doesPhpModuleExist memcache
  doesPhpModuleExist mysqli
  doesPhpModuleExist newrelic
  doesPhpModuleExist openssl
  doesPhpModuleExist pdo_mysql
  doesPhpModuleExist redis
  doesPhpModuleExist SimpleXML
  doesPhpModuleExist session
  doesPhpModuleExist soap
  doesPhpModuleExist xml
  doesPhpModuleExist zip
  doesPhpModuleExist zlib
}

itShouldMatchTheDesiredVersionOfPhp() {
  doesPhpMatchVersion $PHP_VERSION
}

doesCommandExist() {
    if ! [ -x "$(command -v $1)" ]; then
      echo "Error: $1 is not installed." >&2
      exit 1
    else
      echo "$1 Command Exists"
    fi
}

doesPhpModuleExist() {
    MODULE=$(php -m|grep -e "^$1$")
    if [ $1 != "$MODULE" ]; then
      echo "Error: $1 PHP module is not installed." >&2
      exit 1
    else
      echo "$1 Module Exists"
    fi
}

doesPhpMatchVersion() {
    VERSION=$(php -v|grep -i "PHP $1")
    if [ -z "$VERSION" ]; then
      echo "Error: PHP version $1 is not found." >&2
      exit 1
    else
      echo "PHP $1 Exists"
    fi
}

itShouldCheckThatAllInstalledSoftwareExists
itShouldCheckThatAllPhpModulesExists
itShouldMatchTheDesiredVersionOfPhp
