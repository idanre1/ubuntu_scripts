#!/bin/bash
deactivate

aptyes='sudo DEBIAN_FRONTEND=noninteractive apt-get -y '
$aptyes install python3 python3-pip python3-tk virtualenv
virtualenv -p /usr/bin/python3.8 --no-site-packages ~/Envs/py3env

source ~/ubuntu_scripts/python_init.sh

# -----------------------------------------
# Python3
# -----------------------------------------
cd $py3bin
source activate
pip -V
# pip install python-dateutil # parse iso format dates before python 3.7

pip install zmq #pylint

# scrapper
# pip install aiohttp fake_useragent
# pip install scrapy-mongodb
pip install PyYAML
pip install numpy pandas pandas-market-calendars
pip install apscheduler SQLAlchemy dateutil
pip install lxml fake-useragent

pip install dvc[azure] pyAesCrypt

pip install finam-export
pip install alpaca_trade_api
pip install mplfinance

deactivate
