#!/bin/bash
# Usage: install git libcurl4-openssl-dev
cd ~
aptyes='sudo DEBIAN_FRONTEND=noninteractive apt-get -y '

# Update machine
sudo apt-get update

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

# aarc64 to x86 patch
chmod +x ~/scripts/*
\rm -rf ~/scripts/hub
ln -s ~/ubuntu_scripts/hub ~/scripts/hub 

# Jupyter
$aptyes install python3 python3-pip
$aptyes install jupyter-notebook

pip3 install numpy==1.11.3 pandas==0.18.1
pip3 install pyfolio

# IEX
pip3 install pandas_datareader

# TODOS:
echo "For your choice:"
echo "sudo apt-get install openssh-server"

# Trailer
echo "Todos:"
