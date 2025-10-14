#!/bin/bash

NEW_SHELL="/usr/bin/zsh"

# check if the shell exists
if [[ ! -x "$NEW_SHELL" ]]; then
    echo "error: $NEW_SHELL not found or not executable."
    echo "please install zsh first."
    exit 1
fi

CURRENT_SHELL="$SHELL"
echo "current shell: $CURRENT_SHELL"
echo "target shell:  $NEW_SHELL"

# ask for confirmation
read -p "do you want to change your default shell to zsh? (y/n): " answer
if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "operation cancelled. your shell remains $CURRENT_SHELL."
    exit 0
fi

echo "changing shell to $NEW_SHELL..."
if chsh -s "$NEW_SHELL"; then
    echo "shell successfully changed to zsh!"
    echo "you’ll need to log out and log back in for the change to take effect."
else
    echo "failed to change shell. you may need to run this command with sudo or ensure you have permission."
    exit 1
fi
