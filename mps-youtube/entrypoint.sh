#!/usr/bin/env bash

if [ $# -eq 0 ]; then 
  /usr/local/bin/mpsyt
else
  exec "$@"
fi
