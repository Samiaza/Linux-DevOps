#!/bin/bash

uptime -p | awk '{print $2, $3, $4, $5}'