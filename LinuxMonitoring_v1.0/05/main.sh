#!/bin/bash

if [ $# -gt 1 ]
then
  echo "Error: too many options"
elif [ $# -lt 1 ]
then
  echo "Error: too few options"
elif echo $1 | grep -v '/$' > /dev/null
then
  echo "Error: option is not correct (must be \"/\" at the end)"
elif [ ! -d $1 ]
then
  echo "Error: option is not a directory"
else
  TIMEFORMAT="Script execution time (in seconds) = %R"
  time {
    ./print_result.sh $1
  }
fi

