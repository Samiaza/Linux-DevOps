#!/bin/bash

OCT1=$(($RANDOM % 255 + 1))
OCT2=$(($RANDOM % 256))
OCT3=$(($RANDOM % 256))
OCT4=$(($RANDOM % 254 + 1))

echo $OCT1.$OCT2.$OCT3.$OCT4