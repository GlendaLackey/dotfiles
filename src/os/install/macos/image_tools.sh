#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Image Tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# brew_install "Adobe After Effects" "adobe-after-effects-cc" "caskroom/cask" "cask"
brew_install "Adobe Creative Cloud" "adobe-creative-cloud" "caskroom/cask" "cask"
# brew_install "Adobe Illustrator" "adobe-illustrator-cc" "caskroom/cask" "cask"
# brew_install "Adobe Photoshop" "adobe-photoshop-cc" "caskroom/cask" "cask"
# brew_install "Adobe Premier Pro" "adobe-premiere-pro-cc" "caskroom/cask" "cask"

brew_install "GIMP" "lisanet-gimp" "caskroom/cask" "cask"
brew_install "ImageAlpha" "imagealpha" "caskroom/cask" "cask"
brew_install "ImageMagick" "imagemagick --with-webp"
brew_install "ImageOptim" "imageoptim" "caskroom/cask" "cask"
# brew_install "LICEcap" "licecap" "caskroom/cask" "cask"

brew_install "Snagit" "snagit" "caskroom/cask" "cask"
