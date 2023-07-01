#!/bin/bash

DIRLIST=`find / -maxdepth 3 -type d -perm -2 2>/dev/null -not -path "/dev*" -not -path "/run*"`

echo `./get_random_from_list.sh $DIRLIST`\/
