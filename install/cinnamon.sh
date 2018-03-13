#!/bin/bash
set -e

_install()
{
    echo ">>> Installing cinnamon"

    # sudo add-apt-repository ppa:embrosyn/cinnamon
    sudo apt-get update -yq
    sudo apt-get install -y cinnamon cinnamon-core
}


_uninstall()
{
    echo ">>> Uninstalling cinnamon"

    # sudo add-apt-repository -r ppa:embrosyn/cinnamon
    sudo apt update -yq
    sudo apt purge cinnamon cinnamon-core
    sudo apt autoremove -yq
    sudo apt autoclean -yq
}

# ==============================

if [[ $1 == "uninstall" ]]; then
    _uninstall
    exit 0
else
    _install
fi
