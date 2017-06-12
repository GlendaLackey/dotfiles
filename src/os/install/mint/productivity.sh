#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Productivity\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "nixnote2"; then

    add_ppa "nixnote/nixnote2-daily" \
        || print_error "NixNote2 (add PPA)"

    update &> /dev/null \
        || print_error "NixNote2 (resync package index files)" \
    # execute \
    #     "sudo add-apt-repository ppa:nixnote/nixnote2-daily \
    #         && sudo apt-get update" \
    #     "NixNote2 (add repo)"
fi

install_package "NixNote2" "nixnote2"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "sublime-text-installer"; then

    add_ppa "webupd8team/sublime-text-3" \
        || print_error "Sublime Text (add PPA)"

    # update &> /dev/null \
    #     || print_error "Sublime Text (resync package index files)" \
    #
    execute \
        "sudo apt-get update \
            && sudo apt-get install -f" \
        "Sublime Text (resync package index files)"

fi

install_package "Sublime Text" "sublime-text-installer"
