#!/bin/bash

CFCFG='colors.cfg'

if [[ $1 -eq 1 ]]
then
  COLORNUM=default
else
  COLORNUM=`grep $2 $CFCFG | awk -F'=' '{print $2}'`
fi

echo $COLORNUM