#!/bin/bash
# Usage: 
#        sudo apt-get install git libcurl4-openssl-dev
#        wget https://raw.githubusercontent.com/idanre1/ubuntu_scripts/master/install_ubuntu.sh
cd ~
aptyes='sudo DEBIAN_FRONTEND=noninteractive apt-get -y '

git clone https://github.com/idanre1/ubuntu_scripts.git

# virtual X server
$aptyes install xserver-xorg-video-dummy

# Ubuntu specific
#$aptyes install git rclone
#mkdir ~/onedrive

# talib
# Should be before python because its dependant
cd ~
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar xvf ta-lib-0.4.0-src.tar.gz
cd ta-lib
echo "*** Configure TA-LIB"
./configure --prefix=/usr
echo "*** Make TA-LIB"
make
echo "*** Install TA-LIB"
sudo make install
echo "*** Cleaning up"
cd ..
\rm -rf ta-lib-0.4.0-src.tar.gz
\rm -rf ta-lib

# Setting python
~/ubuntu_scripts/python_install.sh
# pip3 install glances # htop replica

# systemd 
sudo cp -t /lib/systemd/system ~/ubuntu_scripts/*.service
sudo systemctl daemon-reload
cd /lib/systemd/system
sudo systemctl enable scheduler_finance.service timewindow_finance.service startup_finance.service

# https://github.com/dyne/Tomb/blob/master/INSTALL.md
#$aptyes install zsh gnupg cryptsetup # pinentry-curses

# database
# aptyes install mongodb # for scrapy
#sudo snap install robo3t-snap

# TODOS:
echo "For your choice:"
echo "sudo apt-get install openssh-server"

# Trailer
echo "Todos:"
echo "always-on, autologin"
echo "update upgrade dist-upgrade"
# echo "crome remote"
echo "Dropbox"
echo "Visual studio code: snap install code --classic"
echo "TWS"
echo "java: apt install ant"
