#!/bin/bash
deactivate

aptyes='sudo DEBIAN_FRONTEND=noninteractive apt-get -y '
$aptyes install python3 python3-pip python3-tk virtualenv
virtualenv -p /usr/bin/python3 --no-site-packages ~/py3env
virtualenv -p /usr/bin/python2 --no-site-packages ~/py2env
virtualenv -p /usr/bin/python3 --no-site-packages ~/iex__legacy_api

source ~/ubuntu_scripts/python_init.sh

# Python3
cd $py3bin
source activate
pip -V
pip install zipline
pip install pipeline-live
#pip install pylint #zmq
pip install apscheduler
pip install ib_insync
pip install TA-Lib #This is a Python wrapper for TA-LIB based on Cython instead of SWIG (https://github.com/mrjbq7/ta-lib)
pip install matplotlib

# scrapper
pip install aiohttp fake_useragent
pip install scrapy-mongodb
deactivate

# Python 2
cd $py2bin
source activate
pip -V
pip install numpy pandas pandas_datareader
pip intstall scipy #pylint zmq

deactivate

# iex_legacy_api Python3
cd $iexbin
source activate
pip -V
pip install zipline
pip install 'pipeline-live==0.1.6'
deactivate

