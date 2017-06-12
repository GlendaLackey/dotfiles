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
./compression_tools.sh
./development.sh
./git.sh
./image_tools.sh
./misc_tools.sh
./../npm.sh
./servers.sh
./tmux.sh
./../vim.sh

./cleanup.sh
