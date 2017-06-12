#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Admin Tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "HTop" "htop"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "NMap" "nmap"
