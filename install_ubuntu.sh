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

$aptyes install source-highlight curl
echo source ~/settings/bashrc >> ~/.bashrc
echo source ~/settings/vimrc >> ~/.vimrc
echo source ~/ubuntu_scripts/python_init.sh >> ~/.bashrc
#$aptyes install nmon # htop nmon.sourceforge.net

# virtual X server
$aptyes xserver-xorg-video-dummy

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

# systemd 
sudo cp -t /lib/systemd/system ~/ubuntu_scripts/*.service
sudo systemctl daemon-reload
cd /lib/systemd/system
sudo systemctl enable scheduler_finance.service timewindow_finance.service startup_finance.service

# https://github.com/dyne/Tomb/blob/master/INSTALL.md
#$aptyes install zsh gnupg cryptsetup # pinentry-curses

# database
aptyes install mongodb # for scrapy
#sudo snap install robo3t-snap

# talib
cd ~
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar xvf ta-lib-0.4.0-src.tar.gz
cd ta-lib
./configure --prefix=/usr
make
sudo make install

# TODOS:
echo "For your choice:"
echo "sudo apt-get install openssh-server"

# Trailer
echo "Todos:"
echo "always-on, autologin"
echo "update upgrade dist-upgrade"
echo "crome remote"
echo "Dropbox"
echo "Visual studio code: snap install code --classic"
echo "TWS"
echo "java: apt install ant"
