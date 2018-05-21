#!/bin/bash

#sudo apt-get purge libappstream3 >/dev/null 2>&1

sudo apt-get update -qy

sudo apt-get install -y \
    ssh lsb-release \
    python-software-properties software-properties-common \
    apt-transport-https \
    ca-certificates \
    bash-completion whois \
    git git-flow git-sh \
    curl wget mc make zip unzip rar unrar \
    sqlite sqlite3 \
    python-mysqldb python-sqlite python-memcache \
    python-pip python-imaging \
    vim nano

sudo apt-get upgrade -qy

sudo apt-get dist-upgrade -qy
    
sudo apt-get install -y ruby gem
