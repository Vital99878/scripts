#!/bin/sh

# Description
# $1 - Component

component=$1

echo "${component^}"

fn () {
  echo "fn imported."
}

export -f fn ./testImport


