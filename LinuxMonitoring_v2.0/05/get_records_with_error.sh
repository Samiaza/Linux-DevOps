#!/bin/bash

rm -rf records_with_error_code.log
cat $@ | awk '$10 ~ /[45]../ {print $0}' >> records_with_error_code.log
cat records_with_error_code.log 
