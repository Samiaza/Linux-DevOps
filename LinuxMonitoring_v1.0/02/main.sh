#!/bin/bash

if [ $# -gt 0 ]
then
echo "Error: too few options"
else
rm -rf tmp.tmp
./print_table.sh >> tmp.tmp
cat tmp.tmp
echo -e "\nWrite the data to a file? (Y/N)"
read -n1 choice

if [ "$choice" = "Y" ] || [ "$choice" = "y" ]
then
filename=`./generate_filename.sh`
cat tmp.tmp > $filename
fi
rm -rf tmp.tmp

fi