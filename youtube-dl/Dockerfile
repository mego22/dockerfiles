# docker run -ti --rm \
#            --name youtube-dl \
#            -v $(pwd):/tmp/downloads \
#            mego22/weechat-slack
#

FROM alpine:latest

RUN apk add --no-cache \
      youtube-dl 

WORKDIR /tmp/downloads

ENTRYPOINT [ "youtube-dl" ]
