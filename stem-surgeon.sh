#!/bin/bash

# Define the directory of the script and venv
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VENV="$DIR/venv"

# Check if virtual environment exists, if not create it and install requirements
if [ ! -d "$VENV" ]; then
    echo "creating venv"
    python3 -m venv "$VENV"
    echo "activating venv"
    source "$VENV/bin/activate"
    echo "installing requirements"
    pip install -r "$DIR/requirements.txt"
else
    source "$VENV/bin/activate"
fi

# Run Python script with all arguments passed to this script
"$DIR/main.py" "$@"
