#!/bin/sh

createComponent () {
  mkdir "$component"
  cd "$component" || exit
  touch "$component.tsx"
  touch "$component.scss"
  printReactComponent "$component"
  # Todo lately add dirs
  cd .. # return co components dir
  addImportExportToIndex "$component"
  echo "component $component created."
}

printReactComponent () {
printf "
import React from 'react'
import './$component.scss'

const $component = () => {
  return (
    <div className="$component">
      $component
    </div>
  )
}

export default $component" > "$component".tsx
}

addImportExportToIndex () {
printf "
import $component from './$component/$component'
" >> index.ts
}


