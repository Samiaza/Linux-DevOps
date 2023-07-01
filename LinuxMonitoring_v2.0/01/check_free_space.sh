#!/bin/bash

df -h / | grep dev | awk '{print $4}' | head -c -1