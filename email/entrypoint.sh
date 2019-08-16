#!/usr/bin/env bash

set -eo pipefail

# start cron
cron

runthis()
{

  exec "$@"
}


main ()
{

  case "$1" in
  mail)
   shift; neomutt;;
  *)
    runthis "$@";;
  esac
}

main "$@"

