#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./build-essentials.sh
./../nvm.sh

./administation.sh
./audio.sh
./browsers.sh
./communications.sh
./compression_tools.sh
./development.sh
./git.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./../npm.sh
./productivity.sh
./servers.sh
./tmux.sh
./../vim.sh

./drivers.sh
./cleanup.sh
