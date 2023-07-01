#!/bin/bash

rm -rf uniq_ip_with_error_code.log
cat $@ | awk '$10 ~ /[45]../{print $1}' | sort -t "." -n -u >> uniq_ip_with_error_code.log
cat uniq_ip_with_error_code.log 
