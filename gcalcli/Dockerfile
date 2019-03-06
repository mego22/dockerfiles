FROM python:3-slim
LABEL maintainer "David James <david@mego22.net>"

ENV HOME /home/gcalcli

RUN adduser --system gcalcli \
	&& chown -R gcalcli $HOME \
	&& pip install vobject parsedatetime gcalcli

WORKDIR $HOME
USER gcalcli

ENTRYPOINT [ "gcalcli" ]
