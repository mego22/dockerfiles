#!/usr/bin/env bash

if [ ! -d /root/.megaCmd ]; then 

  echo "email address:"
  read -r email_address

  echo "password"
  read -rs password
  /usr/bin/mega-login "${email_address}" "${password}"

fi


/usr/bin/mega-cmd
