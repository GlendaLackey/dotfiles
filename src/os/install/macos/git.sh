#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Git\n\n"

brew_install "Git" "git"
# brew_install "Github Desktop" "github-desktop" "caskroom/cask" "cask"
# brew_install "Gitkraken" "gitkraken" "caskroom/cask" "cask"
