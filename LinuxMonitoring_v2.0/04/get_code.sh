#!/bin/bash

CODES=(200 201 400 401 403 404 500 501 502 503)

echo ${CODES[(($RANDOM % ${#CODES[@]}))]}