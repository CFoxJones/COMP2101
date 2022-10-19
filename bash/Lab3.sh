#!/bin/bash

#This is my script for creating and running containers.

#using which command to see if we have lxd already installed.
which lxd >/dev/null
if [ $? -ne 0 ]; then
	#message to state we need lxd installed.
	echo "Installing lxd - May need to enter password to install it"
	sudo snap install lxd
	if [ $? -ne 0 ]; then
	#if it failed exit with error message and status
		echo "Failed to install lxd software required to continue."
		exit 1		
	fi
	else
	#if it suceedeed exit with success message
		echo "Successfully downloaded and installed lxd"
fi
#tested and working as of 10/12/22
#do we have lxdbr0 interface?
ip address show | grep -q lxdbr0
	if [ $? -eq 0 ]; then
#if we do, that is great. it'll let them know
		echo "lxdbr0 exists on this computer"
	else
	#if it doesn't work then install for user
		echo "lxdbr0 is not installed.  Installing now."
		lxd init --auto
		if [ $? -ne 0 ]; then
		#if it doesn't install tell the user
			echo "Could not install lxdbr0"
		else
		#if it is successful then tell the user
			echo "successfully installed lxdbr0 onto this computer"
		fi
	fi
	
sudo lxc list COMP2101-S22
	if [ $? = 0 ]; then
		echo "Container Already on this computer."
		
	else
#if not found then create container
		echo "Could not find container, Creating now."
		lxc launch ubuntu:22.04 COMP2101-S22 
		if [ $? -eq 0 ]; then
			echo "Container created on this computer" 
		else
			echo "Container COMP2101-S22 has not been created"
			exit 1
		fi
		
#If command fails then put error message

#Question number 4, finding ip address for container
sudo lxc list | grep COMP2101-S22 | awk '{print $6}'

#Creating apache 2 inside container
echo "May require sudo password"
sudo lxc exec COMP2101-S22 sudo apt install apache2
if [ $? = 0 ]; then
	echo "apache2 is being installed"
	echo "apache2 has been sucessfully installed"
else 
	echo "apache2 is already installed in this container."
	exit 1
fi



echo "script complete"
