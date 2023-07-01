#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Error: too few options"
elif [ $# -gt 1 ]; then
  echo "Error: too many options"
elif [[ ! $1 =~ ^[123]$ ]]; then
  echo "Error: option must be integer [123]"
else
  ./cleaner.sh $1
fi