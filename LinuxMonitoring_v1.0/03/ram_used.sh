#!/bin/bash

ram_used_mb=`free --mega | grep Mem | awk '{print $3}'`
ram_used_gb=$(bc<<<"scale=3;$ram_used_mb/1024")

echo $ram_used_gb GB