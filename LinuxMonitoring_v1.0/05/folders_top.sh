#!/bin/bash

du -hS $1 | sort -h -r | head -5 | awk '{print NR, "-", $2",", $1}'