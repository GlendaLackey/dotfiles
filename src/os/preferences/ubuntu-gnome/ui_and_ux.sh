#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "../../utils-compiz.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"

execute "gsettings set org.gnome.desktop.background picture-options 'stretched'" \
    "Set desktop background image options"

# execute "gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us', 'ro' ]\"" \
#     "Set keyboard languages"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Defaults:
#   org.compiz.grid bottom-right-corner-action 6 (right half)
#   org.compiz.grid bottom-left-corner-action 4 (left half)
#   org.compiz.grid top-right-corner-action 6 (right half)
#   org.compiz.grid top-left-corner-action 4 (left half)
#
# New settings:
#   org.compiz.grid bottom-right-corner-action 3 (bottom right corner)
#   org.compiz.grid bottom-left-corner-action 1 (bottom left corner)
#   org.compiz.grid top-right-corner-action 9 (top right corner)
#   org.compiz.grid top-left-corner-action 9 (top left corner)

execute "set_compiz_plugin_setting grid bottom-left-corner-action 1 && \
         set_compiz_plugin_setting grid bottom-right-corner-action 3 && \
         set_compiz_plugin_setting grid top-left-corner-action 7 && \
         set_compiz_plugin_setting grid top-right-corner-action 9"  \
    "Set hot-corners for window arrangement"

execute "enable_compiz_plugin put && \
         set_compiz_plugin_setting put put-next-output-key '<Shift><Alt>Right' && \
         set_compiz_plugin_setting put put-prev-output-key '<Shift><Alt>Left'" \
    "Enable multi-monitor hotkeys"
