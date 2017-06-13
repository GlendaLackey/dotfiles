#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Miscellaneous Tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "albert"; then

    add_ppa "nilarimogard/webupd8" \
        || print_error "Albert (add PPA)"

    execute \
        "sudo apt-get update \
            && sudo apt-get install -f" \
        "Albert (resync package index files)"

fi
install_package "Albert" "albert"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Compiz Settings Manager" "compizconfig-settings-manager"
install_package "Compiz Plugins" "compiz-plugins-extra"
install_package "cURL" "curl"

install_package "JQ" "jq"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "powermate"; then

    add_ppa "stefansundin/powermate" \
        || print_error "Powermate (add PPA)"

    # update &> /dev/null \
    #     || print_error "Powermate (resync package index files)" \

    execute \
        "sudo apt-get update \
            && sudo apt-get install -f" \
        "Powermate (resync package index files)"

    # execute \
    #   "wget -q -O /tmp/powermate.deb https://github.com/stefansundin/powermate.deb \
    #       && sudo dpkg -i /tmp/powermate.deb \
    #       && sudo apt-get install -f" \
    #   "Powermate"

fi
install_package "Powermate" "powermate"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Tree" "tree"
install_package "Unity Tweak Tool" "unity-tweak-tool"
install_package "ShellCheck" "shellcheck"
install_package "xclip" "xclip"
