#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Development\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://blog.jayway.com/2017/04/19/running-docker-on-bash-on-windows/
if ! package_is_installed "docker-ce"; then
    execute \
        "sudo apt-get install apt-transport-https ca-certificates software-properties-common \
            && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
            && sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" \
            && sudo apt-get update \
            && sudo apt-get install -f" \
        "Docker (add repo)"
fi
install_package "Docker" "docker-ce"

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

