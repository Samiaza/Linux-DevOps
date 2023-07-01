#!/bin/bash

START=`date +%s.%N`
STARTH="Script started: `date +"%d %b %Y %T"`"

for (( log=1; log<6; log++ )); do
  let "records = 100 + ($RANDOM % 900)"
  LOGNAME=`date +"%Y-%m-%d.log" -d "-$log days"`
  rm -rf ./logs/$LOGNAME
  for (( record=0; record<$records; record++ )); do
    IP=`./get_ip.sh`
    USER=`./get_user.sh`
    DATE=$(date '+%d/%b/%Y:%T %z' -d "06:00 $log days ago + $(($record * 59)) seconds")
    METHOD=`./get_method.sh`
    URL=`./get_url.sh`
    RESPONSE=`./get_code.sh`
    AGENT=`./get_agent.sh`
    echo "$IP - $USER - [$DATE] \"$METHOD $URL HTTP/1.1\" $RESPONSE $RANDOM - \"$AGENT\"" >> ./logs/$LOGNAME
  done
  echo $LOGNAME created
done

END=`date +%s.%N`
ENDH="Script ended: `date +"%d %b %Y %T"`"
RUNTIME=$(echo "scale=3; ($END - $START) / 1" | bc)
RUNTIMEH="Script execution time (in seconds) = $RUNTIME"

echo -e "$STARTH\n$ENDH\n$RUNTIMEH"