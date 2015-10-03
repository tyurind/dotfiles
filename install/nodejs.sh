#!/bin/bash
set -e

echo ">>> Installing nodejs"

# NODE_URL_86="http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x86.tar.gz"
# NODE_URL_64="http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz"
# NODE_LATEST="http://nodejs.org/dist/latest/"




VM="86"
if [ "$(uname -m 2>/dev/null | grep 64)" != "" ]; then VM="64"; fi

LATEST=$(curl -sS https://nodejs.org/dist/latest/SHASUMS256.txt | grep -o -P 'node-.+linux-x.+\.tar\.gz' | grep "$VM")
NODE_URL="http://nodejs.org/dist/latest/${LATEST}"
VERSION=$(echo "${LATEST}" | grep -P -o 'v[.\d]+')

echo "Machine $VM"
echo "Latest: $VERSION,  $NODE_URL"


_install_nodejs()
{
	rm -f /usr/local/bin/node
  	rm -f /usr/local/bin/npm

	mkdir -p /usr/local/lib
	cd /usr/local/lib

	echo ">>> ==> download (... ${LATEST})"
	wget --no-check-certificate -q -O - "$NODE_URL" | tar -xzf -

	NODE_DIR=$(echo "${LATEST}" | sed 's/.tar.gz//g')
	# echo $NODE_DIR
    ln -s "/usr/local/lib/${NODE_DIR}/bin/node" /usr/local/bin/node
    ln -s "/usr/local/lib/${NODE_DIR}/bin/npm" /usr/local/bin/npm

    # npm install -g less http-console jsmin
}


if type node &>/dev/null
then
	if [ "$(node -v 2>/dev/null)" = "${VERSION}" ]; then
		echo "install last version"
	else
		echo "update version ... "
		_install_nodejs
	fi
else
	_install_nodejs
fi
