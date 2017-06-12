#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Development\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://docs.docker.com/engine/installation/linux/ubuntulinux/
if ! package_is_installed "docker-engine"; then
    execute \
        "sudo apt-get install apt-transport-https ca-certificates \
            && sudo echo \"deb https://apt.dockerproject.org/repo ubuntu-xenial main\" | sudo tee /etc/apt/sources.list.d/docker.list \
            && sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
            && sudo apt-get update \
            && sudo apt-get install -f" \
        "Docker (add repo)"
fi
install_package "Docker" "docker-engine"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if package_is_installed "docker-engine"; then
    execute \
        "sudo usermod -a -G docker $USER \
            && sudo systemctl enable docker" \
        "Docker (settings)"
fi

if ! package_is_installed "docker-compose"; then
    execute \
        "sudo curl -L \"https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose \
            && sudo chmod +x /usr/local/bin/docker-compose" \
        "Docker Compose"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# install_package "VirtualBox" "virtualbox"
# install_package "VirtualBox Extension Pack" "virtualbox-ext-pack"
# install_package "VirtualBox UI" "virtualbox-qt"

if package_is_installed "virtualbox"; then

    execute \
        "sudo usermod -a -G vboxusers $USER" \
        "VirtualBox (group membership)"

fi
