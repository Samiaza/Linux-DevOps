#!/bin/bash

ARCRE=".rar$|.tar$|.zip$|.gz$|.shar$|.7z$|.z$|.tgz$"

ls -lAR $1 | grep -E $ARCRE | wc -l