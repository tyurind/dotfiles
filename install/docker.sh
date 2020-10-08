#!/bin/bash


# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# sudo apt-key fingerprint 0EBFCD88

# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"

# sudo apt-get update
# sudo apt-get install docker-ce


install_docker() { 
    echo "download docker"
    curl -fsSL get.docker.com -o /tmp/get-docker.sh
    sudo sh /tmp/get-docker.sh
    rm -f /tmp/get-docker.sh
    sudo docker version
}

install_bash_completion() {
    sudo mkdir -p /etc/bash_completion.d
    sudo curl -fsSL https://raw.githubusercontent.com/docker/compose/1.25.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
}

install_group_docker() {  
    CURRENT_USER=$(id -un)
    if [ "$CURRENT_USER" != "root" ]; then
        sudo usermod -a -G docker $CURRENT_USER
    fi
}

install_docker_machine() {  
  echo "download docker-machine"
  local base=https://github.com/docker/machine/releases/download/v0.16.0
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && \
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine && \
  sudo chmod +x /usr/local/bin/docker-machine

  sudo docker-machine version
  sudo curl -L https://raw.githubusercontent.com/docker/machine/v0.16.0/contrib/completion/bash/docker-machine.bash -o /etc/bash_completion.d/docker-machine

  # base=https://raw.githubusercontent.com/docker/machine/v0.16.0
    # for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
    # do
    #   sudo wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
    # done
}

install_docker_compose() {  
    echo "download docker-compose"
    sudo curl -fsSL https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo docker-compose --version

    sudo curl -L https://raw.githubusercontent.com/docker/compose/1.27.4/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
}

## ======================

sudo apt-get update -q -y && \
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

install_docker
install_bash_completion
install_group_docker
install_docker_machine
install_docker_compose
echo "============================"
echo "OK"
