#!/bin/bash

RE='[1-6]'
FCDB='color_font_db'
BGCDB='color_bg_db'
RESET='\033[0m'

if [ $# -lt 4 ]
then
echo "Error: too few options"
elif [ $# -gt 4 ]
then
echo "Error: too many options"
elif [[ $1 != $RE ]] || [[ $2 != $RE ]] || [[ $3 != $RE ]] || [[ $4 != $RE ]]
then
echo "Error: wrong options"
else
  CC1=`grep ^$1 $BGCDB | awk '{print $2}'``grep ^$2 $FCDB | awk '{print $2}'`
  CC2=`grep ^$3 $BGCDB | awk '{print $2}'``grep ^$4 $FCDB | awk '{print $2}'`
  if [ $1 = $2 ] || [ $3 = $4 ]
  then
  echo -e "\033[31mWarning: Matching font and background colours are entered."
  echo -e "\033[33mMaybe do you want to restart script?"$RESET
  fi
./print_table.sh $CC1 $CC2
fi
