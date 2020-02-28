# run example
# with stored login creds:
# docker run -v ~/.megaCMD -v FILE_PATH:/tmp/mega
#
# without stored login creds:
# docker run -v FILE_PATH:/tmp/mega megacmd

FROM debian:9
LABEL maintainer "David James <david@mego22.net>"

ENV MEGACMD_URL="https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/"

COPY entrypoint.sh /usr/local/bin

# hadolint ignore=DL3003,DL3008,DL3015,DL3027
RUN apt-get update && \
    apt-get install -y curl gnupg2 && \
    cd /tmp && \
    curl -O ${MEGACMD_URL}/megacmd_1.1.0+4.1_amd64.deb && \
    apt install -y /tmp/megacmd_1.1.0+4.1_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*.deb

WORKDIR /tmp/mega

ENTRYPOINT ["entrypoint.sh"]
