#!/bin/sh

# Description
# Temporary for the next feature


VAR_1="to uppercase"
echo "${VAR_1^}"
echo "${VAR_1^^}"

VAR_2="TO  LOWERCASE!"
echo "${VAR_2,}"
echo "${VAR_2,,}"

VAR_3="Reverse Cases"
echo "${VAR_3~}"
echo "${VAR_3~~}"

VAR_1="to uppercase"
echo "$VAR_1" | tr '[a-z]' '[A-Z]'

VAR_2="TO  LOWERCASE!"
echo "$VAR_2" | tr '[A-Z]' '[a-z]'
