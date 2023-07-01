#!/bin/bash

for item in $@; do
  ARR+=( $item )
done

ARRLEN=${#ARR[@]}
MINUNIT=0
MINLEN=${#ARR[$MINUNIT]}

for (( i=0; i < $ARRLEN; i++ )); do
  TMP=${ARR[$i]}
  if [ ${#TMP} -lt $MINLEN ]; then
    MINUNIT=$i
    MINLEN=${#TMP}
  fi
done

CHARTOADD=${ARR[$MINUNIT]:0:1}

ARR[$MINUNIT]+=$CHARTOADD

echo ${ARR[@]}
