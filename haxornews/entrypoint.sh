#!/usr/bin/env bash

if [ $# -eq 0 ]; then 
  /usr/local/bin/haxor-news
else
  exec "$@"
fi
