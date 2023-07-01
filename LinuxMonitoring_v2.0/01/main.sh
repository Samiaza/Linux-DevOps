#!/bin/bash

isuint() {  [[ $1 =~ ^[0-9]+$ ]] ;}

if [ $# -eq 6 ] && [[ $6 =~ kb$ ]]; then
  FILESIZE=`echo -n "$6" | head -c -2`
fi

if [ $# -lt 6 ]; then
  echo "Error: too few options"
elif [ $# -gt 6 ]; then
  echo "Error: too many options"
elif [ ! -d $1 ]; then
  echo "Error: wrong option 1: $1 is not a directory"
elif [ `echo $1 | grep -v ^/` ]; then
  echo "Error: wrong option 1 - $1 is not a absolute path"
elif ! isuint $2;  then
  echo "Error: wrong option 2 - $2 is not a unsigned integer"
elif [[ ! $3 =~ ^[a-z]{1,7}$ ]]; then
  echo "Error: wrong option 3 - \"$3\" is a wrong list of letters"
elif ! isuint $4; then
  echo "Error: wrong option 4 - $4 is not a unsigned integer"
elif [[ ! $5 =~ ^[a-z]{1,7}\.[a-z]{1,3}$ ]]; then
  echo "Error: wrong option 5 - \"$5\" is a wrong lists of letters"
elif [[ ! $6 =~ kb$ ]]; then
  echo "Error: wrong option 6 - file size must be in kilobytes"
elif ! isuint $FILESIZE || [ $FILESIZE -eq 0 ] || [ $FILESIZE -gt 100 ]; then
  echo "Error: wrong option 6 - file size must be from 1 to 100 kilobytes"
else
  if [ `echo $1 | grep -v /$` ]; then
    DIRNAME=`echo $1/`
  else
    DIRNAME=$1
  fi
  ./file_gen.sh $DIRNAME $2 $3 $4 $5 $FILESIZE
fi