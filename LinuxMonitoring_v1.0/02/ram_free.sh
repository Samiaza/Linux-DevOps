#!/bin/bash

ram_free_mb=`free --mega | grep Mem | awk '{print $4}'`
ram_free_gb=$(bc<<<"scale=3;$ram_free_mb/1024")

echo $ram_free_gb GB