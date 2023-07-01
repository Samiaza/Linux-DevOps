#!/bin/bash

rm -rf uniq_ip.log
cat $@ | awk '{print $1}' | sort -t "." -nk1 -u >> uniq_ip.log
cat uniq_ip.log 
