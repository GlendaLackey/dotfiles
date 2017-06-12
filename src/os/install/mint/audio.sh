#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Audio\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "spotify-client"; then
    execute \
        "sudo echo \"deb http://repository.spotify.com stable non-free\" | sudo tee /etc/apt/sources.list.d/spotify.list \
            && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 13B00F1FD2C19886 \
            && sudo apt-get update \
            && sudo apt-get install -f" \
        "Spotify (add repo)"
fi

install_package "Spotify" "spotify-client"
