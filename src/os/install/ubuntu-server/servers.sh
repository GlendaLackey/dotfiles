#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Servers\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "NFS Common" "nfs-common"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "OpenSSH Server" "openssh-server"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Samba (Server)" "samba"
install_package "Samba (Client)" "samba-client"
