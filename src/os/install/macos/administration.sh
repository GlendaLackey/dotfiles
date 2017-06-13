#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Admin Tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "AppCleaner" "appcleaner" "caskroom/cask" "cask"
brew_install "Beyond Compare" "beyond-compare" "caskroom/cask" "cask"
brew_install "CCleaner" "ccleaner" "caskroom/cask" "cask"
brew_install "Cocktail" "cocktail" "caskroom/cask" "cask"
# brew_install "DNSMasq" "dnsmasq"
brew_install "iStat Menus" "istat-menus" "caskroom/cask" "cask"
brew_install "Microsoft Remote Desktop" "microsoft-remote-desktop-beta" "caskroom/versions" "cask"
brew_install "MTR" "mtr"
brew_install "NMap" "nmap"
brew_install "Stay" "stay" "caskroom/cask" "cask"
