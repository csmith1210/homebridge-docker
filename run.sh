#!/bin/bash

rm /var/run/dbus/pid #incase shutdown abruptly

# avahi config
sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

# start avahi
dbus-daemon --system
avahi-daemon -D

# install homebridge plugins
bash /root/install_plugins.sh /root/.homebridge/pluginsInstallList
mv /root/.homebridge/pluginsInstallList /root/.homebridge/pluginsInstallList.done

# start homebridge
homebridge -P /root/.homebridge/plugins
