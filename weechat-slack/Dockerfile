# docker run -ti --rm \
#            --name weechat \
#            -e "SLACK_TOKEN=${token}" \
#            mego22/weechat-slack

FROM alpine:latest

ENV HOME "/home/user"
ENV SLACK_TOKEN ""

RUN adduser --disabled-password -h ${HOME} user && \
    apk add --no-cache \
      ca-certificates \
      python \
      py-pip \
      weechat \
      weechat-aspell \
      weechat-lua \
      weechat-perl \
      weechat-python \
      weechat-ruby && \
    wget -P /tmp https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py && \
    wget -P /tmp https://raw.githubusercontent.com/cmurphy/weechat-shrug/master/shrug.py && \
    pip install websocket-client && \
    chown -R user: ${HOME}

COPY entrypoint.sh "${HOME}/entrypoint.sh"

WORKDIR $HOME
USER user

ENTRYPOINT [ "/home/user/entrypoint.sh" ]
