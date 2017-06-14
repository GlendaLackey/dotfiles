#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Communications\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# brew_install "Airdroid" "airdroid" "caskroom/cask" "cask"
# brew_install "Android File Transfer" "android-file-transfer" "caskroom/cask" "cask"
brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
brew_install "Filezilla" "filezilla" "caskroom/cask" "cask"
brew_install "Google Drive" "google-drive" "caskroom/cask" "cask"
brew_install "LogMeIn Client" "logmein-client" "caskroom/cask" "cask"
brew_install "Skype" "skype" "caskroom/cask" "cask"
brew_install "Slack" "slack" "caskroom/cask" "cask"
brew_install "Teamviewer" "teamviewer" "caskroom/cask" "cask"
brew_install "Transmission" "transmission" "caskroom/cask" "cask"
# brew_install "OwnCloud" "owncloud"
brew_install "WhatsApp" "whatsapp" "caskroom/cask" "cask"
