#!/bin/bash

(du -hS $1; du -hSa $1) | sort -h -r | uniq -u | head -10 |
 awk 'n=split($2,a,"."){print NR, "-", $2",", $1",", a[n]}'