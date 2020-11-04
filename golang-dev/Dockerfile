FROM golang:1.15.2
LABEL maintainer "David James <david@mego22.net>"
LABEL org.label-schema.vcs_url="https://github.com/mego22/dockerfiles"
LABEL org.opencontainers.image.source="https://github.com/mego22/dockerfiles"
LABEL net.mego22.run-example="docker run -it --rm --name golang-dev-${PWD} -v ~/.vimrc:/root/vimrc:ro -v ~/.vim:/root/vim:ro golang-dev:VERSIO:/etc/hostname:ro mego22/golang-dev:VERSION"


RUN set -eux; \
      apt-get update && apt-get install -y vim

