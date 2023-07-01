#!/bin/bash

NAMELIST=$@

TEMPLATE=`./get_str_from_list.sh $NAMELIST`
while [ ${#TEMPLATE} -lt 5 ]; do
  NAMELIST=`./insert_sym_to_list.sh $NAMELIST`
  TEMPLATE=`./get_str_from_list.sh $NAMELIST`
done
echo $NAMELIST
