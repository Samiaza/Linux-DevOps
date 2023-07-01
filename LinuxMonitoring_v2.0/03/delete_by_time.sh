#!/bin/bash

read -p "Enter date in followinf format: YYYY-MM-DD : " DATE
read -p "Enter start time in followinf format: HH:MM : " TIMESTART
read -p "Enter end time in followinf format: HH:MM : " TIMEEND
find / -maxdepth 4 2>/dev/null -not -path "/dev*" -not -path "/run*" \
        -newerct "$DATE $TIMESTART" ! -newerct "$DATE $TIMEEND" -delete