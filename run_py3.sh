#!/bin/bash
deactivate

source ~/ubuntu_scripts/python_init.sh

# Python3
cd $py3bin
source activate
python $*