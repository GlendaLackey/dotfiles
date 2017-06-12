#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# brew_install "NeoVim" "neovim/neovim/neovim"
brew_install "Vim" "vim --with-override-system-vi"
