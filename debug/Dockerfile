FROM debian

LABEL maintainer "David James <david@mego22.net>"
LABEL org.label-schema.vcs-url="https://github.com/mego22/dockerfiles"
LABEL org.label-schema.version="0.1"
LABEL net.mego22.run-example="docker run -it --pid=container:seglan-audit --net=container:seglan-audit --cap-add sys_admin debian"

RUN apt-get update ; \
      DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
      curl \
      htop \
      less \ 
      netcat \
      nmap \
      procps \ 
      strace \
      tar \
      tcpdump \
      vim \
      wget \
      zip; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*.deb

RUN echo "alias ll='ls -l'" >> /etc/profile.d/debug.sh && \
    echo "set -o vi" >> /etc/profile.d/debug.sh

ENTRYPOINT ["/bin/bash", "-l"]
