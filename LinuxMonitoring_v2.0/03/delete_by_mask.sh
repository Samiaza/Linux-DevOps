#!/bin/bash

NAMESUFF=`date +"_%d%m%y"`
find / -maxdepth 5 2>/dev/null -name *$NAMESUFF* -not -path "/dev*" -not -path "/run*" \
        -delete