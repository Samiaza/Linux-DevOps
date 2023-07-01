#!/bin/bash

#hostname -I

ifconfig | grep inet | head -1 | awk '{print $2}'