#!/bin/bash

AGENTS=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" \
        "Microsoft Edge" "Crawler and bot" "Library and net tool")

echo ${AGENTS[(($RANDOM % ${#AGENTS[@]}))]}