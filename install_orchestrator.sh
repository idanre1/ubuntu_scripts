#!/bin/bash
# Usage: install git libcurl4-openssl-dev
#        git clone https://github.com/idanre1/ubuntu_scripts.git
cd ~
# Make sure no questions asked :)
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update

#Git + fetch workspace from git
sudo apt-get install git libcurl4-openssl-dev
git clone https://github.com/idanre1/settings.git
git clone https://github.com/idanre1/scripts.git
git clone https://github.com/idanre1/ubuntu_scripts.git

#Making nice linux
sudo ln -s ~ /nas
sudo ln -s /home/$USER /home/idan

sudo apt-get install source-highlight curl
echo source ~/settings/bashrc >> ~/.bashrc
echo source ~/settings/vimrc >> ~/.vimrc
echo source ~/ubuntu_scripts/python_init.sh >> ~/.bashrc
#sudo apt-get install nmon # htop nmon.sourceforge.net

# virtual X server
# sudo apt-get xserver-xorg-video-dummy

# aarc64 to x86 patch
chmod +x ~/scripts/*
\rm -rf ~/scripts/hub
ln -s ~/ubuntu_scripts/hub ~/scripts/hub 

# Setting python
~/ubuntu_scripts/python_install.sh
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
# TODOS:
# ###################################################################
echo "For your choice:"

echo "sudo apt-get update"
echo "sudo apt-get upgrade"
echo "sudo apt-get dist-upgrade"
echo "java: apt install ant"
