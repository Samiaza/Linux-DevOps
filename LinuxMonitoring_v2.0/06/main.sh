
#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Error: too few options"
elif [ $# -gt 1 ]; then
  echo "Error: too many options"
else
  ./start_goaccess.sh $1
fi
