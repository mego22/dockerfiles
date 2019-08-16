# docker run -ti --rm \
#            --name mail \
#            -v ~/.mbsync:/home/mail/.mbsync \
#            -v ~/.msmtprc:/home/mail/.msmtprc \
#            -v ~/.neomuttrc:/home/mail/.neomuttrc \
#            -v ~/Maildir:/home/mail/Maildir 
#            mego22/mail


FROM debian:buster

LABEL  maintainer="david@mego22.net"

ARG DEBIAN_FRONTEND=noninteractive                                                                                     
RUN apt-get update -q && \
    apt-get install -q -y ca-certificates \
                       neomutt \
                       isync \
                       mu4e \
                       lynx \
                       msmtp \
                       cron \
                       vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
