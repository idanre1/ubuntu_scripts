#!/bin/bash
# Usage: install git libcurl4-openssl-dev
cd ~
aptyes='sudo DEBIAN_FRONTEND=noninteractive apt-get -y '

#Git + fetch workspace from git
$aptyes install git libcurl4-openssl-dev
git clone https://github.com/idanre1/settings.git
git clone https://github.com/idanre1/scripts.git
git clone https://github.com/idanre1/ubuntu_scripts.git

#Making nice linux
sudo ln -s ~ /nas
sudo ln -s /home/$USER /home/idan

$aptyes install source-highlight
echo source ~/settings/bashrc >> ~/.bashrc
echo source ~/ubuntu_scripts/python_init.sh >> ~/.bashrc
#$aptyes install nmon # htop nmon.sourceforge.net

# aarc64 to x86 patch
chmod +x ~/scripts/*
\rm -rf ~/scripts/hub
ln -s ~/ubuntu_scripts/hub ~/scripts/hub 

# Ubuntu specific
#$aptyes install git rclone
#mkdir ~/onedrive

# Setting python
~/ubuntu_scripts/python_install.sh
pip3 install glances # htop

# TODOS:
echo "For your choice:"
echo "sudo apt-get install openssh-server"

# Trailer
echo "Todos:"
echo "always-on, qutologin"
echo "update upgrade dist-upgrade"
echo "crome remote"
echo "Dropbox"
echo "Visual studio code"
echo "TWS"
