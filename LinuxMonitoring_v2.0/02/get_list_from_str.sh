#!/bin/bash

STR=$1
STRLEN=${#STR}
for (( i=0; i < $STRLEN; i++ )); do
  ARR+=( ${STR:$i:1} )
done
echo ${ARR[@]}
