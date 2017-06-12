#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Utility\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Caffeine" "caffeine" "caskroom/cask" "cask"
brew_install "Keyboard Maestro" "keyboard-maestro" "caskroom/cask" "cask"
brew_install "Griffin Powermate" "powermate" "caskroom/cask" "cask"
brew_install "iTerm" "iterm2" "caskroom/cask" "cask"
brew_install "JQ" "jq"
brew_install "Powermate" "powermate" "caskroom/cask" "cask"
brew_install "Tree" "tree"
brew_install "Yarn" "yarn"
brew_install "WGet" "wget"