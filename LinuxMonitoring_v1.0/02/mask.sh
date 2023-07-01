#!/bin/bash

ifconfig | grep `./ip.sh` | awk '{print $4}'

# ipcalc `./ip.sh` | grep mask | awk '{print $2}'