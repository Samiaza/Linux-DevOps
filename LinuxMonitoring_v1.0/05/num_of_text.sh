#!/bin/bash

ls -lAR $1 | grep ".txt$" | wc | awk '{print $1}'