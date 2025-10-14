#!/bin/bash

TPM_DIR="$HOME/.config/tmux/plugins/tpm"

# check if tpm is already installed
if [[ -d "$TPM_DIR" ]]; then
    echo "TPM is already installed at $TPM_DIR. exiting..."
    exit 0
fi

# if not installed, clone the tpm repository
echo "installing TPM..."
git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"

# check if the installation was successful
if [[ $? -eq 0 ]]; then
    echo "TPM has been successfully installed."
else
    echo "failed to install TPM."
    exit 1
fi
