#!/bin/bash

rm -rf code_sorted.log
cat $@ | sort -k 10 >> code_sorted.log
cat code_sorted.log
