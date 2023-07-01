#!/bin/bash

while true
do
    cpu="$(cat /proc/stat | head -1 | awk '{print $4}')"
    memfree="$(cat /proc/meminfo | awk '/MemFree/{print $2*1024}')"
    diskfree="$(df / | tail -1 | awk '{print $4*1024}')"

echo -e "cpu_system_seconds $cpu\nmemory_free_bytes $memfree\nfilesystem_free_bytes $diskfree" > ./html/index.html
    sleep 3
done