FROM golang

LABEL maintainer="david@mego22.net"

COPY slack-term.conf entrypoint.sh /tmp/

RUN useradd -ms /bin/bash slackterm && \
    chown slackterm:slackterm /tmp/slack-term.conf && \
    go get -u github.com/erroneousboat/slack-term && \
    cd $GOPATH/src/github.com/erroneousboat/slack-term && \
    go install .

USER slackterm

ENTRYPOINT /tmp/entrypoint.sh
