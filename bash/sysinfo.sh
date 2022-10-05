#!/bin/bash
#Showing the systems FQDN
echo "FQDN:"
hostname 
#Showing the OS name and version
hostnamectl 
#Showing an IP Address
echo "IP Address:"
hostname --all-ip-addresses 
#Showing the amount of space only in the root filesystem
echo "Root Filesystem Status:"
df /root -h
