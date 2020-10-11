#!/bin/bash
# Usage: install git libcurl4-openssl-dev
#        git clone https://github.com/idanre1/ubuntu_scripts.git
cd ~
aptyes='sudo DEBIAN_FRONTEND=noninteractive apt-get -y '

$aptyes update

#Git + fetch workspace from git
$aptyes install git libcurl4-openssl-dev
git clone https://github.com/idanre1/settings.git
git clone https://github.com/idanre1/scripts.git
git clone https://github.com/idanre1/ubuntu_scripts.git

#Making nice linux
sudo ln -s ~ /nas
sudo ln -s /home/$USER /home/idan

$aptyes install source-highlight curl
echo source ~/settings/bashrc >> ~/.bashrc
echo source ~/settings/vimrc >> ~/.vimrc
echo source ~/ubuntu_scripts/python_init.sh >> ~/.bashrc
#$aptyes install nmon # htop nmon.sourceforge.net

# virtual X server
# $aptyes xserver-xorg-video-dummy

# aarc64 to x86 patch
chmod +x ~/scripts/*
\rm -rf ~/scripts/hub
ln -s ~/ubuntu_scripts/hub ~/scripts/hub 

# Setting python
~/ubuntu_scripts/python_install_orchestrator.sh
# pip3 install glances # htop replica

# database
# aptyes install mongodb # for scrapy
#sudo snap install robo3t-snap

# talib
# cd ~
# wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
# tar xvf ta-lib-0.4.0-src.tar.gz
# cd ta-lib
# ./configure --prefix=/usr
# make
# sudo make install

# ###################################################################
# Docker
# ###################################################################
# Update the apt package index and install packages to allow apt to use a repository over HTTPS
$aptyes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
$aptyes install docker-ce docker-ce-cli containerd.io
# Docker compose container
sudo curl -L --fail https://github.com/docker/compose/releases/download/1.27.4/run.sh -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# ###################################################################
# TODOS:
# ###################################################################
echo "For your choice:"

echo "sudo apt-get update"
echo "sudo apt-get upgrade"
echo "sudo apt-get dist-upgrade"
echo "java: apt install ant"
