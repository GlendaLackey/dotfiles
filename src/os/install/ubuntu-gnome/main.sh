#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./build-essentials.sh
./git.sh

./../nvm.sh

./administration.sh
./audio.sh
./browsers.sh
./communications.sh
./compression_tools.sh
./development.sh
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
