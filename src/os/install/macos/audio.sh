#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Audio\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Airfoil" "airfoil" "caskroom/cask" "cask"
# brew_install "Android File Transfer" "android-file-transfer" "caskroom/cask" "cask"
brew_install "Amazon Music" "amazon-music" "caskroom/cask" "cask"
brew_install "Audio Hijack" "audio-hijack" "caskroom/cask" "cask"
brew_install "djay Pro" "djay-pro" "caskroom/cask" "cask"
brew_install "Fission" "fission" "caskroom/cask" "cask"
brew_install "Hear" "hear" "caskroom/cask" "cask"
brew_install "LineIn" "linein" "caskroom/cask" "cask"
brew_install "Spotify" "spotify" "caskroom/cask" "cask"
