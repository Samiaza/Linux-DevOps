#!/bin/bash

ls -lAR $1 | grep "^-" | wc | awk '{print $1}'