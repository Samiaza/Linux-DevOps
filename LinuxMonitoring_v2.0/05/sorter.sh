#!/bin/bash

START=`date +%s.%N`
STARTH="Script started: `date +"%d %b %Y %T"`"

LOGS="../04/logs/*.log"

case $1 in
  "1")
    ./sort_by_code.sh $LOGS
  ;;
    
  "2")
    ./get_uniq_ip.sh $LOGS
  ;;

  "3")
    ./get_records_with_error.sh $LOGS
  ;;

  "4")
    ./get_uniq_ip_with_error.sh $LOGS
  ;;
esac

END=`date +%s.%N`
ENDH="Script ended: `date +"%d %b %Y %T"`"
RUNTIME=$(echo "scale=3; ($END - $START) / 1" | bc)
RUNTIMEH="Script execution time (in seconds) = $RUNTIME"

echo -e "$STARTH\n$ENDH\n$RUNTIMEH"
