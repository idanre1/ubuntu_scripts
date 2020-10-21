#!/bin/bash
SWAP_ON=`sudo swapon --show`

if [$SWAP_ON -eq '']; then
	echo "*** There is no swap. starting process"
	#https://linuxize.com/post/how-to-add-swap-space-on-ubuntu-18-04/

	# create swap file
	sudo fallocate -l 4G /swapfile
	#If fallocate is not installed or you get an error message saying fallocate failed:
	#	Operation not supported then use the following command to create the swap file:
	#	sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576

	# only root should write to swap
	sudo chmod 600 /swapfile

	#Use the mkswap utility to set up a Linux swap area on the file:
	sudo mkswap /swapfile

	#Activate the swap file using the following command:
	sudo swapon /swapfile

	#To make the change permanent open the /etc/fstab file:
	sudo sh -c 'echo /swapfile swap swap defaults 0 0 >> /etc/fstab'
fi