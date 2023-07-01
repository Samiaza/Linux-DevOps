#!/bin/bash

find $1 -type f -perm /a=x -exec du -h {} \; | sort -h -r | head -10 |
 awk '{cmd="md5sum "$2; cmd | getline md5; close(cmd);
      print NR, "-", $2",", $1",", md5}' |
 awk '{print $1, $2, $3, $4, $5}'