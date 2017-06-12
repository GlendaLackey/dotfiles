#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Admin Tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# if ! package_is_installed "bcompare"; then
#
#     execute \
#       "sudo apt-get install -y libqtwebkit4 \
#           && wget -q -O /tmp/beyondcompare.deb http://www.scootersoftware.com/bcompare-4.1.9.21719_amd64.deb \
#           && sudo dpkg -i /tmp/beyondcompare.deb \
#           && sudo apt-get install -f \
#           && rm /tmp/beyondcompare.deb" \
#       "Beyond Compare"
# fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "HTop" "htop"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "NMap" "nmap"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# install_package "Remmina" "remmina"
# install_package "Remmina RDP Plugin" "remmina-plugin-rdp"
# install_package "Remmina VNC Plugin" "remmina-plugin-vnc"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# if ! package_is_installed "teamviewer"; then
#
#     execute \
#         "sudo apt-get install -y libgcc1:i386 libasound2:i386 libdbus-1-3:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libsm6:i386 libxdamage1:i386 libxext6:i386 libxfixes3:i386 libxrender1:i386 zlib1g:i386 libjpeg62:i386 libxinerama1:i386 libxrandr2:i386 libxtst6:i386 \
#             && sudo apt-get install -f" \
#         "TeamViewer (dependencies)"
#
#     execute \
#       "wget -q -O /tmp/teamviewer.deb https://download.teamviewer.com/download/teamviewer_i386.deb \
#           && sudo dpkg -i /tmp/teamviewer.deb \
#           && sudo apt-get install -f \
#           && rm /tmp/teamviewer.deb" \
#       "TeamViewer"
# fi
