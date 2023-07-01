#!/bin/bash

ls -lAR $1 | grep ^d | wc | awk '{print $1}'