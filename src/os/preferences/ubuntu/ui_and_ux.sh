#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "../../utils-compiz.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"

# execute "gsettings set com.canonical.indicator.bluetooth visible false" \
#     "Hide bluetooth icon from the menu bar"

# execute "gsettings set com.canonical.indicator.sound visible false" \
#     "Hide volume icon from the menu bar"

execute "gsettings set com.canonical.indicator.power icon-policy 'charge' && \
         gsettings set com.canonical.indicator.power show-time false" \
    "Hide battery icon from the menu bar when the battery is not in use"

# http://www.cplusplus.com/reference/ctime/strftime/
execute "gsettings set com.canonical.indicator.datetime custom-time-format '%a %b %d %H:%M' && \
         gsettings set com.canonical.indicator.datetime time-format 'custom'" \
    "Use custom date format in the menu bar"

execute "gsettings set org.gnome.desktop.background picture-options 'stretched'" \
    "Set desktop background image options"

# execute "gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us', 'ro' ]\"" \
#     "Set keyboard languages"

execute "gsettings set com.canonical.Unity.Launcher favorites \"[
            'ubiquity-gtkui.desktop',
            'nautilus-home.desktop'
         ]\"" \
    "Set Launcher favorites"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "gsettings set com.canonical.Unity.Launcher launcher-position Bottom" \
        "Move Luncher to Bottom"

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
