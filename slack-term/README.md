# slack-term

## Usage
This container lets runs [slack-term](https://github.com/erroneousboat/slack-term) in a container.
You will need a [slack token](https://api.slack.com/docs/oauth-test-tokens) for this to work.

```bash
  docker run -ti \
         -e "SLACK_TOKEN=YOUR_SLACK_TOKEN" \
         mego22/slackterm
```
