#!/bin/sh

# !Add folder structure
# !Add description
# !Add path where PageComponent need to create
# !Create function addComponent () {}
# !Create function addTextToComp () {}

cd "$3" || return

mkdir "$1" # createing root folder by pageComponent and adding needed files: index.ts, $1Page.tsx, $1Page.scss
cd "$3"'/'"$1" || return
touch index.ts
printf "import $1Page from './$1-page'
        export default $1Page" > index.ts

touch "$1-page.tsx"
printf "
import React from 'react'
import './$1-page.scss'
const $1Page: React.FC = () => {
  return (
    <Layout pageHeading='$1'>
      <main className='$1'>
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

# createing components usedin the pageComponent and adding needed files for every component
# !Need to create loop for adding every component

mkdir components
cd "components" || exit
touch index.ts
mkdir "$2"

cd "$2" || exit
touch "$2.tsx"
touch "$2.scss"

echo "✅ Page $1 успешно создана";
