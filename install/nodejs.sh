#!/bin/bash
set -e

echo ">>> Installing nodejs"

# NODE_URL_86="http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x86.tar.gz"
# NODE_URL_64="http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz"
# NODE_LATEST="http://nodejs.org/dist/latest/"


# VM="86"
# if [ "$(uname -m 2>/dev/null | grep 64)" != "" ]; then VM="64"; fi

# LATEST=$(curl -sS http://nodejs.org/dist/latest/SHASUMS.txt | grep -o -P 'node-.+linux-x.+\.tar\.gz' | grep "$VM")
# NODE_URL="http://nodejs.org/dist/latest/${LATEST}"


NODE_URL="https://nodejs.org/dist/v8.9.3/node-v8.9.3-linux-x64.tar.gz"

sudo mkdir -p /usr/local/lib
cd /usr/local/lib

if [ "$(node -v 2>/dev/null | grep 'v0')" = "" ]; then
    echo ">>> ==> download (... ${LATEST})"
    sudo wget --no-check-certificate -O - "$NODE_URL" | sudo tar -xzf -
    sudo ln -s /usr/local/lib/node-v8.9.3-linux-x64/bin/node /usr/local/bin/node
    echo "node -> /usr/local/bin/node"
    
    sudo ln -s /usr/local/lib/node-v8.9.3-linux-x64/bin/npm /usr/local/bin/npm
    echo "npm -> /usr/local/bin/npm"

    cd /usr/local/lib/node-v8.9.3-linux-x64
    sudo mkdir -p etc
    # sudo touch etc/npmrc
    echo "prefix=/usr/local" | sudo tee etc/npmrc
    echo "prefix=/usr/local"

    sudo npm install -g npm
    sudo npm install -g webpack gulp
fi
