FROM alpine
LABEL maintainer "David James <david@mego22.net>"
LABEL org.label-schema.vcs_url="https://github.com/mego22/dockerfiles"
LABEL org.opencontainers.image.source="https://github.com/mego22/dockerfiles"
LABEL net.mego22.run-example="curl -s https://raw.githubusercontent.com/stedolan/jq/master/tests/modules/data.json | docker run --rm -i mego22/jq .[]"


RUN set -eux; \
      apk add --update jq

ENTRYPOINT ["jq"]
