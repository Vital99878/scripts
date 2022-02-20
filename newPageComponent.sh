#!/bin/sh

# Description
# $1 - Page
# $2 Components - string typed "comp1 comp2 ...". Components used only in the current page
# #3 Path - absolute path where Page need to create

# !Todo Add folder structure
# !Todo Add description
# !Todo Add path where PageComponent need to create
# !Todo Create function addComponent () {}
# !Todo Create function addTextToComp () {}

cd "$3" || return


mkdir "$1" # creating root folder by pageComponent and adding needed files: index.ts, $1Page.tsx, $1Page.scss
cd "$3"'/'"$1" || return
touch index.ts
printf "
import $1Page from './$1-page'
export default $1Page" > index.ts


touch "$1-page.tsx" # creating pageComponent files and write there basic logic
printf "
import React from 'react'
import './$1-page.scss'
const $1Page: React.FC = () => {
  return (
    <Layout pageHeading='page-$1'>
      <main className='page-$1'>
        Some components
      </main>
    </Layout>
  )
}
export default $1Page" > "$1-page.tsx"


touch "$1-page.scss"
printf "
.$1 {
  padding: 1rem;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
" > "$1"-page.scss

# creating components used in the pageComponent and adding needed files for every component
# !Need to create loop for adding every component

mkdir components
cd "components" || exit
touch index.ts

for component in $2
do
   mkdir "$component"
   cd "$component" || exit
   touch "$component.tsx"
   touch "$component.scss"
   echo "$component created"
   cd ..
done


echo "✅ Page $1 успешно создана";
