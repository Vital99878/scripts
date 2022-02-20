#!/bin/sh
source ./helpers.sh

# Description
# $1 - Page
# $2 Components - string typed "comp1 comp2 ...". Components used only in the current page
# #3 Path - absolute path where Page need to create

# !Todo Add folder structure
# !Todo Add description
# !Todo Add path where PageComponent need to create
# !Todo Create function addComponent () {}
# !Todo Create function addTextToComp () {}

  label=$1
  components=$2
  path=$3

cd "$path" || return


mkdir "$1" # creating root folder by labelComponent and adding needed files: index.ts, $1Page.tsx, $1Page.scss
cd "$path"'/'"$label" || return
touch index.ts
printf "
import $labelPage from './$label-label'
export default $labelPage" > index.ts

touch "$label-page.tsx"
printf "
import React from 'react'
import './$label-label.scss'
const $labelPage: React.FC = () => {
  return (
    <Layout labelHeading='label-$label'>
      <main className='label-$label'>
        Some components
      </main>
    </Layout>
  )
}
export default $labelPage" > "$label-label.tsx"


touch "$label-label.scss"
printf "
.$label {
  padding: 1rem;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
" > "$label"-label.scss

# creating components used in the labelComponent and adding needed files for every component

mkdir components
cd "components" || exit
touch index.ts
printf "
export { }
" > index.ts

for component in $2
do createComponent "$component"
done

echo "✅ Page $label успешно создана";
