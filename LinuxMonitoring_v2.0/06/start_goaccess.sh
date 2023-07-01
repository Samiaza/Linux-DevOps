#!/bin/bash

case $1 in
  "virtual")
    goaccess ../04/logs/*.log --log-format=COMBINED --real-time-html
  ;;
    
  "local")
    sudo goaccess ../04/logs//*.log --log-format=COMBINED --real-time-html -o ./html/index.html --daemonize
    sudo docker compose up --build
  ;;

  * )
    echo unrecognized option...
  ;;
esac
