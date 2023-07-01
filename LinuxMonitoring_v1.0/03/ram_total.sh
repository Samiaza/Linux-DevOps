#!/bin/bash

ram_total_mb=`free --mega | grep Mem | awk '{print $2}'`
ram_total_gb=$(bc<<<"scale=3;$ram_total_mb/1024")

echo $ram_total_gb GB