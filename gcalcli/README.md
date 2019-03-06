[gcalcli](https://github.com/insanum/gcalcli)
-------
# Basic usage

## No auth file
If you don't have a `~/.gcalcli_oauth` run:
```
docker run -it --rm -v ~/.gcalcli_oauth:/home/gcalcli/.gcalcli_oauth mego22/gcalcli --noauth_local_webserver list
```

## List calendars
```
docker run -it --rm -v ~/.gcalcli_oauth:/home/gcalcli/.gcalcli_oauth mego22/gcalcli list
```
## List events for the next few days
```
docker run -it --rm -e "TZ=America/New_York" -v ~/.gcalcli_oauth:/home/gcalcli/.gcalcli_oauth gcalcli agenda
```
