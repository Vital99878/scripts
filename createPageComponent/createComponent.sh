#!/bin/sh


# Description
# $1 - Component

component=$1

createComponent () {
#   mkdir "$component"
#   cd "$component" || exit
#   touch "$component.tsx"
#   touch "$component.scss"
#   #Todo lately add dirs
#   cd ..
#  echo "component $component created."
  echo "component $component created."
}

export -f createComponent ./newPageComponent.sh



