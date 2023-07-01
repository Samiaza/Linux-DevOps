#!/bin/bash

ls -lAR $1 | grep ".conf$" | wc | awk '{print $1}'