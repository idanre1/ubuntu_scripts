#!/bin/bash

# Installation proc
if [ "$1" = "install" ]; then

	echo "Installing tiny firewall"
	sudo addgroup no-internet
	sudo cp -f firewall.rules /etc/network/if-pre-up.d/iptables-no-internet-rule
	sudo /etc/network/if-pre-up.d/iptables-no-internet-rule
	echo 'sudo visudo %sudo ALL=(:no-internet)   NOPASSWD: ALL'
	exit
fi

# Normal run
echo "Init tiny firewall"
echo "Command: $@"
sudo -g no-internet "$@"
