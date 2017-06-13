#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./bash.sh
./../nvm.sh

./administration.sh
./audio.sh
./browsers.sh
./communications.sh
./compression_tools.sh
./development.sh
./git.sh
./gpg.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./productivity.sh
./../npm.sh
./tmux.sh
./utility.sh
./video_tools.sh
./../vim.sh
./web_font_tools.sh

./cleanup.sh
