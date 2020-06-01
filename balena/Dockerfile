FROM debian

LABEL maintainer "David James <david@mego22.net>"
LABEL org.label-schema.url="https://github.com/balena-io/balena-cli"
LABEL net.mego22.run-example="balena local flash --help"
LABEL net.mego22.run-example2="balena local flash path/to/image.img --drive /dev/disk2 --yes"

ENV VERSION=v11.35.15

WORKDIR /tmp

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes curl zip; \
    curl -sLJO https://github.com/balena-io/balena-cli/releases/download/${VERSION}/balena-cli-${VERSION}-linux-x64-standalone.zip; \
    unzip balena-cli-${VERSION}-linux-x64-standalone.zip -d /usr/local/bin/; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*.deb /tmp//balena-cli-*

entrypoint ["/usr/local/bin/balena-cli/balena"]
