#!/bin/sh

if [[ -z ${SLACK_TOKEN} ]]; then echo "Provide your Slack token."; exit; fi

weechat -r "/python load /tmp/autosort.py; \
            /python load /tmp/wee_slack.py; \
            /python load /tmp/weemoji.py; \
            /set plugins.var.python.slack.slack_api_token \"${SLACK_TOKEN}\";\
            /python reload slack;"
