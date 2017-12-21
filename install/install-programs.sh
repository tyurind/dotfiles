#!/bin/bash

# sudo apt-get purge libappstream3

sudo apt-get install -y \
	python-software-properties software-properties-common \
    apt-transport-https \
    ca-certificates \
    bash-completion whois \
    git curl mc make zip unzip rar unrar \
    sqlite sqlite3 \
    python-mysqldb python-sqlite python-memcache \
    python-pip python-imaging \
    vim \

    
sudo apt-get install -y ruby gem
