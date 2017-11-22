#!/bin/bash

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Configure user nobody to match unRAID's settings
usermod -u 99 nobody
usermod -g 100 nobody
usermod -d /home nobody
chown -R nobody:users /home

# Disable SSH
rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

mkdir -p /var/run/dbus

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################

# Repositories
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"

sudo apt-get update
sudo apt-get install -qy git make gcc g++
curl -sL https://deb.nodesource.com/setup_6.x | bash -
sudo apt-get install -qy nodejs
sudo apt-get install -qy avahi-daemon avahi-discover libnss-mdns libavahi-compat-libdnssd-dev

##################################################
# Install homebridge                             #
##################################################

sudo npm install -g homebridge

#########################################
##        INSTALL EXTRA PACKAGES       ##
#########################################

sudo npm install -g ps4-waker
sudo apt-get install -qy samba-common

#########################################
##                 CLEANUP             ##
#########################################

# Clean APT install files
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
