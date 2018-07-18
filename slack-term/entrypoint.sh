#!/usr/bin/env bash

set -eo pipefail

export USER="slackterm"

runthis()
{

  exec "$@"
}


main () 
{
  case "$1" in
  runthis)
    shift; runthis "$@";;
  *)
    local MYTOKEN=${SLACK_TOKEN?default}
    sed -i s/TOKEN/${MYTOKEN}/g /tmp/slack-term.conf
    stty cols 24 && slack-term -config /tmp/slack-term.conf
  esac
}

main "$@"
