#!/bin/bash

read -p "Enter log file " LOGFILE

while IFS="" read -r line
do
    name=`echo "$line" | awk '{print $1}'`
    if [ -e $name ]; then
    rm -rf $name
    fi
done < $LOGFILE