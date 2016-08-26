FROM phusion/baseimage:0.9.15

##################################################
# Install tools                                  #
##################################################

RUN apt-get update && apt-get install \
	nodejs \
	git \
	avahi-daemon \
	avahi-discover \
	libnss-mdns \
	libavahi-compat-libdnssd-dev \
	make \
	g++ \
	&& rm -rf /var/cache/apk/*

##################################################
# Install homebridge                             #
##################################################

RUN npm install -g homebridge

##################################################
# Start                                          #
##################################################

USER root

RUN mkdir -p /var/run/dbus

EXPOSE 5353 51826

ADD install_plugins.sh /root/install_plugins.sh
ADD run.sh /root/run.sh

VOLUME ["/root/.homebridge"]
CMD ["/root/run.sh"]
