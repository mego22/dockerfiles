#docker run -it --rm \
#      	-v /etc/localtime:/etc/localtime:ro \
#       -v $HOME/.rainbow_oauth:/root/.rainbow_oauth \
#       -v $HOME/.rainbow_config.json:/root/.rainbow_config.json \
#       --name rainbowstream \
#	      mego22/rainbowstream

FROM python:3

LABEL  maintainer="david@mego22.net"

RUN pip install rainbowstream

ENTRYPOINT [ "rainbowstream" ]
