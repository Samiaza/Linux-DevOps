#!/bin/bash

USERS=(`cat /etc/passwd | awk -F ":" '{print $1}'`)

echo ${USERS[(($RANDOM % ${#USERS[@]}))]}