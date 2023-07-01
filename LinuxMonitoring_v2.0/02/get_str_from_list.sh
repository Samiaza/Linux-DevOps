#!/bin/bash

for item in $@; do
  OUT+=`echo -n $item`
done
echo $OUT