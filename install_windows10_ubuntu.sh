#!/bin/bash
# Usage: install git libcurl4-openssl-dev
cd ~
aptyes='sudo DEBIAN_FRONTEND=noninteractive apt-get -y '

git clone https://github.com/idanre1/ubuntu_scripts.git

# Jupyter
pip3 install numpy==1.11.3 pandas==0.18.1
pip3 install pyfolio

# IEX
pip3 install pandas_datareader

# TODOS:
echo "For your choice:"
echo "sudo apt-get install openssh-server"

# Trailer
echo "Todos:"
