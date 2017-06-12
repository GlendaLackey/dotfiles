#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ "$installSystem76" = true ] || [ "$installSystem76Nvidia" = true ] || [ "$installNvidia" = true ]; then
    print_in_purple "\n   Drivers\n\n"
fi

if [ "$installSystem76" = true ]; then

    add_ppa "system76-dev/stable" \
        || print_error "System76 Drivers (add PPA)"

    update &> /dev/null \
        || print_error "System76 Drivers (resync package index files)" \

    install_package "System76 Drivers" "system76-driver"

fi

if [ "$installSystem76Nvidia" = true ]; then

    install_package "System76 NVIDIA Drivers" "system76-driver-nvidia"

fi

if [ "$installNvidia" = true ]; then

    add_ppa "graphics-drivers/ppa" \
        || print_error "NVIDIA Drivers (add PPA)"

    update &> /dev/null \
        || print_error "NVIDIA Drivers (resync package index files)" \

    install_package "NVIDIA Drivers" "nvidia-375"

fi
