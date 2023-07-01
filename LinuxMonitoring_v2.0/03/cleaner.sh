#!/bin/bash

START=`date +%s.%N`
STARTH="Script started: `date +"%d %b %Y %T"`"

echo Free space before cleaning = `./check_free_space.sh`

case $1 in
  "1")
    ./delete_by_log.sh
  ;;
    
  "2")
    ./delete_by_time.sh
  ;;

  "3")
    ./delete_by_mask.sh
  ;;
esac

END=`date +%s.%N`
ENDH="Script ended: `date +"%d %b %Y %T"`"
RUNTIME=$(echo "scale=3; ($END - $START) / 1" | bc)
RUNTIMEH="Script execution time (in seconds) = $RUNTIME"

echo -e "$STARTH\n$ENDH\n$RUNTIMEH"
echo Free space after cleaning = `./check_free_space.sh`