#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -L "/usr/local/bin/stem-surgeon" ]; then
    echo "stem-surgeon is already installed. Overwriting..."
    sudo rm /usr/local/bin/stem-surgeon
fi

sudo ln -s "$DIR/main.py" /usr/local/bin/stem-surgeon

echo "Installation completed! You can now use stem-surgeon command."
