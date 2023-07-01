#!/bin/bash

sudo docker compose up --build -d

sleep 10

stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s