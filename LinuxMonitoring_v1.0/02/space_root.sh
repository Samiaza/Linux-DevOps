#!/bin/bash

space_root_total_kb=`df /root | grep dev | awk '{print $2}'`
space_root_total_mb=$(bc<<<"scale=2;$space_root_total_kb/1024")

echo $space_root_total_mb MB