#!/bin/bash

# ls -lAR $1 | cut -d ' ' -f1 | grep x | grep -v d | wc -l
find $1 -type f -perm /a=x | wc -l