#!/bin/bash

#gathering data
#Creating  fqdn variable to hold FQDN
fqdn=$(hostname -f )
#Creating osversion variable
source /etc/os-release
#Creating Ip variable
ip=$(hostname --all-ip-addresses)
#Creating Filesystem free space variable
harddrive=$(df -h --output=avail / | grep Avail -v)

#Using an output template
cat <<eof

Report Lab 2 For $HOSTNAME
==========================
FQDN: $fqdn
Operating System name and version: $PRETTY_NAME
IP Address: $ip
Root Filesystem Free Space: $harddrive
=========================
eof

