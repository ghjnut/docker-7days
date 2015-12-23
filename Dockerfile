FROM steamcmd:auth

MAINTAINER Jake Pelletier <ghjnut@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# For testing purposes
RUN apt-get update \
	&& apt-get install -y \
		telnet \
#		net-tools \
#		vim \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Should be cut down
EXPOSE 8080 8081 26900

WORKDIR /opt/7days

# This container will be executable
ENTRYPOINT ["./startserver.sh"]
CMD ["-configfile=serverconfig.xml"]
