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
ln -fs /home/$USER/orchestrator /home/$USER/algo
# set timezone
sudo timedatectl set-timezone Asia/Jerusalem

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
# $aptyes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# Add Docker’s official GPG key
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below
# sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
# $aptyes install docker-ce docker-ce-cli containerd.io
# Docker compose container
# sudo curl -L --fail https://github.com/docker/compose/releases/download/1.27.4/run.sh -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# ###################################################################
# gitea
# ###################################################################
# git
adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

# gitea
sudo chown -R git:git /home/$USER/gitea
sudo -u git ln -fs /home/$USER/orchestrator/app.ini /home/$USER/gitea/app.ini 
# Add repo signing key to apt
sudo curl -sL -o /etc/apt/trusted.gpg.d/morph027-gitea.asc https://packaging.gitlab.io/gitea/gpg.key
# Add repo to apt
echo "deb [arch=amd64] https://packaging.gitlab.io/gitea gitea main" | sudo tee /etc/apt/sources.list.d/morph027-gitea.list
sudo apt-get update
sudo apt-get install gitea


# systemd 
sudo systemctl disable gitea.service
sudo cp -t /lib/systemd/system ~/ubuntu_scripts/*.service
sudo systemctl daemon-reload
cd /lib/systemd/system
sudo systemctl enable gitea.service
sudo systemctl restart scheduler_finance.service


# ###################################################################
# TODOS:
# ###################################################################
echo "For your choice:"

echo "sudo apt-get update"
echo "sudo apt-get upgrade"
echo "sudo apt-get dist-upgrade"
echo "java: apt install ant"
echo "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash"
