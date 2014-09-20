#!/bin/bash

if [ ! -f /usr/local/bin/wp ]; then
    printf "\n"
    echo "Installing WP-CLI..."
    printf "\n"
    wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    # Executable permission
    chmod a+x /usr/local/bin/wp

    # Download auto completion
    wget -qO /etc/bash_completion.d/wp-completion.bash https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash

    echo "Done!"
    exit 1
fi