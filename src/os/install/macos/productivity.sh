#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Productivity\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Evernote" "evernote" "caskroom/cask" "cask"
brew_install "LibreOffice" "libreoffice" "caskroom/cask" "cask"
brew_install "Macdown" "macdown" "caskroom/cask" "cask"
brew_install "Microsoft Office" "microsoft-office" "caskroom/cask" "cask"
brew_install "Sublime Text" "sublime-text" "caskroom/cask" "cask"
