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
LABEL org.label-schema.url="https://github.com/donnemartin/haxor-news"

ADD entrypoint.sh /usr/local/bin

RUN pip install haxor-news

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
