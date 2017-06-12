#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Privacy\n\n"

execute "gsettings set com.canonical.Unity.Lenses remote-content-search 'none'" \
    "Turn off 'Remote Search' so that search terms in Dash do not get sent over the internet"

execute "gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false" \
    "Disable Dash 'More suggestions' section"

execute "gsettings set org.gnome.settings-daemon.plugins.power active false" \
    "Disable Screen Dimming"

execute "gsettings set org.gnome.desktop.screensaver idle-activation-enabled false" \
    "Disable Screensaver"
