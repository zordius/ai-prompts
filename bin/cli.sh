#!/bin/bash

# Get the directory of the script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
# Navigate up to the project root directory
PROJECT_ROOT=$(dirname "$SCRIPT_DIR")

# Construct the absolute path to the gemini.md file based on the first argument
FILE_PATH="${PROJECT_ROOT}/${1}/gemini.md"

if command -v gemini &> /dev/null
then
    # If gemini is found, read the content of the specified file and pipe it to gemini
    if [ -f "$FILE_PATH" ]; then
        cat "$FILE_PATH" | gemini
    else
        echo "Error: Invalid argument. No gemini.md file found for '$1' at $FILE_PATH"
        echo "Possible arguments are:"
        find "$PROJECT_ROOT" -type f -name "gemini.md" | sed "s|${PROJECT_ROOT}/||" | sed "s|/gemini.md||" | while read -r dir; do
            echo "  - $dir"
        done
        exit 1
    fi
else
    echo "gemini command not found. Attempting to install @google/gemini-cli globally via npm..."
    npm install -g @google/gemini-cli
    if [ $? -eq 0 ]; then
        echo "Installation successful. Please try running the command again."
    else
        echo "Failed to install @google/gemini-cli. Please ensure npm is installed and configured correctly, or install gemini manually."
        exit 1
    fi
fi
