#!/bin/bash

isnum() { echo $1 | awk '{print ($1 == $1 + 0)}'; }

if [ $# -eq 0 ]
then
echo "Error: too few options"
elif [ $# -gt 1 ]
then
echo "Error: too many options"
elif [ `isnum $1` -eq 1 ]
then
echo "Error: option is number"
else
echo "$1"
fi