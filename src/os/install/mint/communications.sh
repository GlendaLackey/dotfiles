#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Communications\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://www.linuxbabe.com/cloud-storage/install-dropbox-ubuntu-16-04
if ! package_is_installed "dropbox"; then
    execute \
        "sudo echo \"deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu wily main\" | sudo tee /etc/apt/sources.list.d/dropbox.list \
            && sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E \
            && sudo apt-get update \
            && sudo apt-get install python-gpgme \
            && sudo apt-get install -f" \
        "Dropbox (add repo)"
fi
install_package "Dropbox" "dropbox"
# install_package "Dropbox (Nautilus Integration)" "nautilus-dropbox"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://www.howtoinstall.co/en/ubuntu/xenial/filezilla
install_package "Filezilla" "filezilla"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Gnome Control Center" "gnome-control-center"
install_package "Gnome Online Accounts" "gnome-online-accounts"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Skype" "skype"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Slack" "slack"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "thunderbird"; then

    add_ppa "ubuntu-mozilla-security/ppa" \
        || print_error "Thunderbird (add PPA)"

    update &> /dev/null \
        || print_error "Thunderbird (resync package index files)" \

fi

install_package "Thunderbird" "thunderbird"
