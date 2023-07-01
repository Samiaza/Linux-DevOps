#!/bin/bash

space_root_free_kb=`df /root | grep dev | awk '{print $4}'`
space_root_free_mb=$(bc<<<"scale=2;$space_root_free_kb/1024")

echo $space_root_free_mb MB