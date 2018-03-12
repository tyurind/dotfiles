#!/bin/bash

set -e
DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )

cd $DIR

sudo dpkg -i ./ubuntu16.04_remastersys_3.2.1_amd64/*.deb 2>&1
sudo apt-get install -y -f
