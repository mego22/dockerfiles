FROM golang 

LABEL maintainer "David James <david@mego22.net>"
LABEL org.label-schema.vcs_url="https://github.com/mego22/dockerfiles"
LABEL org.opencontainers.image.source https://github.com/mego22/dockerfiles

RUN export GO111MODULE=on && \
    go get -ldflags "-linkmode external -extldflags -static" github.com/go-jira/jira/cmd/jira

FROM alpine

COPY --from=0 /go/bin/jira /usr/local/bin/jira

ENTRYPOINT ["/usr/local/bin/jira"]
