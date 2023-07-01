#!/bin/bash

FREESPACE=`./check_free_space.sh`

ENOUGHFLAG=1
if [ `echo $FREESPACE | grep -v G$` ]; then
  ENOUGHFLAG=0
fi

if [ $ENOUGHFLAG -eq 1 ]; then
  FREESPACE=${FREESPACE::-1}
  ENOUGHFLAG=`echo $FREESPACE | awk '{print ($1 > 1.0)}'`
fi

echo -n $ENOUGHFLAG