#!/bin/bash

space_root_used_kb=`df /root | grep dev | awk '{print $3}'`
space_root_used_mb=$(bc<<<"scale=2;$space_root_used_kb/1024")

echo $space_root_used_mb MB