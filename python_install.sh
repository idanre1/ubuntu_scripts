#!/bin/bash
deactivate

apt-yes install python3 python3-pip python3-tk virtualenv
virtualenv -p /usr/bin/python3 --no-site-packages py3env
virtualenv -p /usr/bin/python2 --no-site-packages py2env

source ~/ubuntu_scripts/python_init.sh

# Python3
cd $py3bin
source activate
pip -V
pip install zipline
pip install pipeline-live

deactivate

# Python 2
cd $py2bin
source activate
pip -V
pip install numpy pandas

deactivate

# Trailer
echo "Todos:"
echo "Dropbox"
echo "Visual studio code"
echo "TWS"
