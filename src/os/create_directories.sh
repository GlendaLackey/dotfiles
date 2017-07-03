#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRECTORIES=(
      "$HOME/Downloads/_Pluralsight"
      "$HOME/Downloads/_Transmission"
      "$HOME/Setup"
      "$HOME/Source"
      "$HOME/Source/Bitbucket"
      "$HOME/Source/Bitbucket/GlendaLackey"
      "$HOME/Source/GitHub"
      "$HOME/Source/GitHub/GlendaLackey"
      "$HOME/Source/Local"
      "$HOME/Temporary"
    )

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create directories\n\n"
    create_directories
}

main
