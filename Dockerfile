FROM ubuntu:16.04
MAINTAINER remipassmoilesel
LABEL name="ubuntu_prepared" description="Ubuntu with Open/SSH and Apache2 servers"

ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

# Install dependencies
RUN apt-get update && \
	apt-get install -y openssh-server apache2 \
	wget curl vim-nox sudo bash

RUN useradd --create-home -G sudo --shell /bin/bash admin && \
	echo "admin:admin" | chpasswd	

ENTRYPOINT /opt/entrypoint.sh

EXPOSE 80 22
