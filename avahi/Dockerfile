FROM alpine
LABEL maintainer "David James <david@mego22.net>"
LABEL org.label-schema.vcs_url="https://github.com/mego22/dockerfiles"
LABEL org.opencontainers.image.source https://github.com/mego22/dockerfiles
LABEL net.mego22.run-example="docker run -d --rm --name avahi --net=host -v /etc/hostname:/etc/hostname:ro mego22/avahi"


RUN set -eux; \
      apk add --update avahi avahi-tools; \
      sed -i 's/#enable-dbus=yes/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

ENTRYPOINT ["/usr/sbin/avahi-daemon"]

