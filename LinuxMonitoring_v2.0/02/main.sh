#!/bin/bash

isuint() {  [[ $1 =~ ^[0-9]+$ ]] ;}

if [ $# -eq 3 ] && [[ $3 =~ Mb$ ]]; then
  FILESIZE=`echo -n "$3" | head -c -2`
fi

if [ $# -lt 3 ]; then
  echo "Error: too few options"
elif [ $# -gt 3 ]; then
  echo "Error: too many options"
elif [[ ! $1 =~ ^[a-z]{1,7}$ ]]; then
  echo "Error: wrong option 1 - \"$1\" is a wrong list of letters"
elif [[ ! $2 =~ ^[a-z]{1,7}\.[a-z]{1,3}$ ]]; then
  echo "Error: wrong option 2 - \"$2\" is a wrong lists of letters"
elif [[ ! $3 =~ Mb$ ]]; then
  echo "Error: wrong option 3 - file size must be in megabytes"
elif ! isuint $FILESIZE || [ $FILESIZE -eq 0 ] || [ $FILESIZE -gt 100 ]; then
  echo "Error: wrong option 6 - file size must be from 1 to 100 megabytes"
else
  ./file_gen.sh $1 $2 $FILESIZE
fi