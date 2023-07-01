#!/bin/bash

RESET='\033[0m'

echo -e $1"HOSTNAME"$RESET = $2"`./hostname.sh`"$RESET 
echo -e $1"TIMEZONE"$RESET = $2"`./timezone.sh`"$RESET 
echo -e $1"USER"$RESET = $2"`./user.sh`"$RESET 
echo -e $1"OS"$RESET = $2"`./os.sh`"$RESET 
echo -e $1"DATE"$RESET = $2"`./date.sh`"$RESET 
echo -e $1"UPTIME"$RESET = $2"`./uptime.sh`"$RESET 
echo -e $1"UPTIME_SEC"$RESET = $2"`./uptime_sec.sh`"$RESET 
echo -e $1"IP"$RESET = $2"`./ip.sh`"$RESET 
echo -e $1"MASK"$RESET = $2"`./mask.sh`"$RESET 
echo -e $1"GATEWAY"$RESET = $2"`./gateway.sh`"$RESET 
echo -e $1"RAM_TOTAL"$RESET = $2"`./ram_total.sh`"$RESET 
echo -e $1"RAM_USED"$RESET = $2"`./ram_used.sh`"$RESET 
echo -e $1"RAM_FREE"$RESET = $2"`./ram_free.sh`"$RESET 
echo -e $1"SPACE_ROOT"$RESET = $2"`./space_root.sh`"$RESET 
echo -e $1"SPACE_ROOT_USED"$RESET = $2"`./space_root_used.sh`"$RESET 
echo -e $1"SPACE_ROOT_FREE"$RESET = $2"`./space_root_free.sh`"$RESET 