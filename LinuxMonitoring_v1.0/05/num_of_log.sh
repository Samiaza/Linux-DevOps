#!/bin/bash

ls -lAR $1 | grep ".log$" | wc | awk '{print $1}'