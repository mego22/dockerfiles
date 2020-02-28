#!/usr/bin/env bash

WHAT_NEEDS_TO_BE_BUILT=$(git diff --dirstat HEAD~1 HEAD | awk -F'[%/'] '{gsub(/ /, "", $2);print $2}')

for image in ${WHAT_NEEDS_TO_BE_BUILT}; do
  if [ ! -f "${image}/Dockerfile" ]; then break; fi

  make lint_dockerfile DIR="${image}"
  rtval=$?
  #if [ $rtval -ne 0 ]; then exit; fi

  make build DIR="${image}"
  rtval=$?
  if [ $rtval -ne 0 ]; then exit; fi

  make push IMAGE="${image}"
  rtval=$?
  if [ $rtval -ne 0 ]; then exit; fi

done
