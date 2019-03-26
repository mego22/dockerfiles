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
      weechat-perl \
      weechat-python && \
    pip install websocket-client && \
    wget -P /tmp https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py && \
    wget -P /tmp https://raw.githubusercontent.com/de-vri-es/weechat-autosort/master/autosort.py && \
    wget -P /tmp https://raw.githubusercontent.com/kattrali/weemoji/master/weemoji.py && \
    chown -R user: ${HOME}

COPY entrypoint.sh "${HOME}/entrypoint.sh"

WORKDIR $HOME
USER user

ENTRYPOINT [ "/home/user/entrypoint.sh" ]
