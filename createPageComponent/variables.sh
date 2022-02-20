#!/bin/sh
# Description
# Data for print in files

stylePageComponents=""
reactPageComponent="
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
                   export default $labelPage"

reactComponent=""
importToRelativePath=""



