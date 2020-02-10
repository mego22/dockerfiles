#!/usr/bin/env bash

GIT_SHA1=$(git rev-parse --verify HEAD | cut -c -10)
CONTAINERS_TO_BUILD=$(git diff --name-only HEAD HEAD~1 | sort | cut -d\/ -f1 | uniq)


for CONTAINER in "${CONTAINERS_TO_BUILD}"; do
  echo ${CONTAINER}
  if [[ -f ${CONTAINER}/Dockerfile ]]; then
    echo "Building ${CONTAINER}";
  fi
done
