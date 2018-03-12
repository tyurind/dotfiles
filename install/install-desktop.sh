#!/bin/bash

# sudo apt-get purge libappstream3

sudo apt-get install -y \
	deja-dup \
	terminator
# ===========================
TEMP_DIR=$(mktemp -d)

chmod 777 $TEMP_DIR

mkdir "$TEMP_DIR/deb"

cd "$TEMP_DIR/deb"

# wget 'https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb'
wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
wget 'https://download.teamviewer.com/download/linux/teamviewer_amd64.deb'
wget 'https://releases.hashicorp.com/vagrant/2.0.2/vagrant_2.0.2_x86_64.deb'
wget 'https://download.virtualbox.org/virtualbox/5.2.8/virtualbox-5.2_5.2.8-121009~Ubuntu~yakkety_amd64.deb'

sudo dpkg -i ./*.deb
sudo apt-get install -y -f
# sudo dpkg -i ./*.deb


# sudo rm -rf $TEMP_DIR


