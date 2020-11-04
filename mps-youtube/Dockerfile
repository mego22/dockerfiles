# run example
# haxor-news "shell"
# docker run -ti --rm haxornews
#
# top 10 articles
# docker run --rm haxornews hn top
#
# read article
# docker run --rm haxornew view 1

FROM python:3
LABEL maintainer "David James <david@mego22.net>"
LABEL org.label-schema.url="https://github.com/mps-youtube/mps-youtube"
LABEL org.opencontainers.image.source="https://github.com/mego22/dockerfiles"

ENV VERSION=0.4.2

COPY entrypoint.sh /usr/local/bin

RUN apt-get update && \
      DEBIAN_FRONTEND=noninteractive apt-get install --yes pulseaudio && \
      pip install mps-youtube youtube-dl && \
      apt-get clean && apt-get purge

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

