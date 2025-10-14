#!/bin/bash

PLUGIN_DIR="$HOME/.config/zsh/plugins"
PLUGINS=(
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-syntax-highlighting"
    "Aloxaf/fzf-tab"
)

mkdir -p "$PLUGIN_DIR"

for plugin in "${PLUGINS[@]}"; do
    plugin_name=$(basename "$plugin")
    plugin_dir="$PLUGIN_DIR/$plugin_name"

    if [[ ! -d "$plugin_dir" ]]; then
        echo "cloning $plugin_name..."
        git clone "https://github.com/$plugin.git" "$plugin_dir"
    else
        echo "$plugin_name is already installed."
    fi
done
