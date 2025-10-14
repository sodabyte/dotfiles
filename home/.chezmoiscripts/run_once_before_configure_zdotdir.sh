#!/bin/bash

FILE_PATH="/etc/zsh/zshenv"

# check if the file exists
if [[ -e "$FILE_PATH" ]]; then
    echo "file already exists: $FILE_PATH"
    echo "current content:"
    cat "$FILE_PATH"

    # ask if the user wants to overwrite the file
    read -p "do you want to overwrite this file with the new ZDOTDIR? (y/n): " answer
    if [[ "$answer" != "y" ]]; then
        echo "exiting without making changes."
        exit 0
    fi
else
    echo "file does not exist, proceeding to create it."
fi

# prompt for the USER variable
read -p "enter the username for ZDOTDIR: " username

# validate username input
if [[ -z "$username" ]]; then
    echo "username cannot be empty. exiting."
    exit 1
fi

# overwrite or create the file with the new ZDOTDIR value
echo "ZDOTDIR=/home/$username/.config/zsh" | sudo tee "$FILE_PATH" > /dev/null

echo "file $FILE_PATH has been overwritten with the new ZDOTDIR value."
echo "content of the file:"
cat "$FILE_PATH"
