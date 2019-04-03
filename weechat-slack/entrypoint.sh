#!/bin/sh

if [[ -z ${SLACK_TOKEN} ]]; then echo "Provide your Slack token."; exit; fi

weechat -r "/script install autosort.py; \
            /script install go.py; \
            /script install vimode.py; \
            /python load /tmp/shrug.py; \
            /python load /tmp/wee_slack.py; \
            /set plugins.var.python.slack.slack_api_token \"${SLACK_TOKEN}\"; \
            /python reload slack; \
            /mouse enable;"

