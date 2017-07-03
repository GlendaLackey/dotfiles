#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# if ! package_is_installed "google-chrome-unstable"; then
#
#     add_key "https://dl-ssl.google.com/linux/linux_signing_key.pub" \
#         || print_error "Chrome Canary (add key)"
#
#     add_to_source_list "[arch=amd64] https://dl.google.com/linux/deb/ stable main" "google-chrome.list" \
#         || print_error "Chrome Canary (add to package resource list)"
#
#     update &> /dev/null \
#         || print_error "Chrome Canary (resync package index files)"
#
# fi
#
# install_package "Chrome Canary" "google-chrome-unstable"
# install_package "Chromium" "chromium-browser"

# http://www.ubuntumaniac.com/2016/05/how-to-install-latest-version-of-google.html
if ! package_is_installed "google-chrome-stable"; then
    execute \
        "wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
            && sudo sh -c 'echo \"deb http://dl.google.com/linux/chrome/deb/ stable main\" >> /etc/apt/sources.list.d/google-chrome.list' \
            && sudo apt-get update \
            && sudo apt-get install -f" \
        "Google Chrome (add repo)"
fi

install_package "Google Chrome" "google-chrome-stable"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# printf "\n"
#
# if ! package_is_installed "firefox-trunk"; then
#
#     add_ppa "ubuntu-mozilla-daily/ppa" \
#         || print_error "Firefox Nightly (add PPA)"
#
#     update &> /dev/null \
#         || print_error "Firefox Nightly (resync package index files)"
#
# fi
#
# install_package "Firefox Nightly" "firefox-trunk"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# printf "\n"
#
# install_package "Flash" "flashplugin-installer"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# printf "\n"
#
# if ! package_is_installed "opera"; then
#
#     add_key "https://deb.opera.com/archive.key" \
#         || print_error "Opera (add key)"
#
#     add_to_source_list "https://deb.opera.com/opera-stable/ stable non-free" "opera.list" \
#         || print_error "Opera (add to package resource list)"
#
#     update &> /dev/null \
#         || print_error "Opera (resync package index files)"
#
# fi

# Automatically answer `Yes` to the `package configuration` prompt.
# https://github.com/GlendaLackey/dotfiles/issues/17

# printf "opera-stable opera-stable/add-deb-source boolean true\n" \
#     | sudo debconf-set-selections
#
# install_package "Opera" "opera-stable"
#
# printf "opera-beta opera-beta/add-deb-source boolean true\n" \
#     | sudo debconf-set-selections
#
# install_package "Opera Beta" "opera-beta"
#
# printf "opera-developer opera-developer/add-deb-source boolean true\n" \
#     | sudo debconf-set-selections
#
# install_package "Opera Developer" "opera-developer"
