#!/bin/sh

PHP_VERSION=7.3

itShouldCheckThatAllInstalledSoftwareExists() {
    doesCommandExist php
    doesCommandExist composer
}

itShouldCheckThatAllPhpModulesExists() {
  doesPhpModuleExist bcmath
  doesPhpModuleExist curl
  doesPhpModuleExist date
  doesPhpModuleExist intl
  doesPhpModuleExist json
  doesPhpModuleExist mbstring
  doesPhpModuleExist mcrypt
  doesPhpModuleExist mysqli
  doesPhpModuleExist newrelic
  doesPhpModuleExist openssl
  doesPhpModuleExist pdo_mysql
  doesPhpModuleExist redis
  doesPhpModuleExist SimpleXML
  doesPhpModuleExist session
  doesPhpModuleExist soap
  doesPhpModuleExist sockets
  doesPhpModuleExist xml
  doesPhpModuleExist zip
  doesPhpModuleExist zlib
}

itShouldMatchTheDesiredVersionOfPhp() {
  doesPhpMatchVersion $PHP_VERSION
}

itShouldCheckThatOpCacheIsEnabled() {
    OP_CACHE=$(php -i | grep 'opcache.enable => On')
    if [ -z "$OP_CACHE" ]; then
      echo "Error: OpCache not enabled." >&2
      exit 1
    else
      echo "OpCache enabled"
    fi
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
itShouldCheckThatOpCacheIsEnabled
