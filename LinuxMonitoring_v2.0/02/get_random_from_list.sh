#!/bin/bash

for DIR in $@; do
  ARR+=($DIR)
done

let "RANDNUM=$RANDOM % $#"

echo ${ARR[$RANDNUM]}
