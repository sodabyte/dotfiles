#!/bin/bash

# dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# list of dotfiles and their target directories
declare -A DOTFILES_TARGETS=(
    [config]="$HOME/.config"
    [git]="$HOME"
    [zsh]="$HOME"
    [termux]="$HOME/.termux"
)

# check if gnu stow is installed
if ! command -v stow &> /dev/null; then
    echo "GNU Stow is not installed. Please install it first."
    exit 1
fi

# remove existing conflicting files or directories
remove_conflicts() {
    local target_dir=$1
    local source_dir=$2

    # check for existing files/directories that would conflict
    for file in $(stow -n -v -t "$target_dir" "$source_dir" 2>&1 | grep -oP '(?<=existing target ).*'); do
        echo "Removing conflicting file or directory: $target_dir/$file"
        rm -rf "$target_dir/$file"
    done
}

# loop through each dotfile and stow it
for DOTFILE in "${!DOTFILES_TARGETS[@]}"; do
    TARGET_DIR="${DOTFILES_TARGETS[$DOTFILE]}"
    
    # ensure the target directory exists
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Creating target directory: $TARGET_DIR"
        mkdir -p "$TARGET_DIR"
    fi

    # remove conflicting files if they exist
    remove_conflicts "$TARGET_DIR" "$DOTFILE"

    # stow the dotfiles
    echo "Stowing $DOTFILE to $TARGET_DIR..."
    stow -d "$DOTFILES_DIR" -t "$TARGET_DIR" "$DOTFILE"
done

echo "Dotfiles installation complete!"
