#!/bin/bash

# Install dependencies.
if command -v pacman &>/dev/null; then
    pacman -Syu git neovim fish tmux
elif command -v apt &>/dev/null; then
    apt install git neovim fish tmux
else
    echo "This script only supports Debian and Arch based systems."
fi

# Paths.
WORK_TREE="$HOME"
NVIM_DIR="$WORK_TREE/.config/nvim"
GIT_DIR="$NVIM_DIR/.git"
SPARSE_FILE="$GIT_DIR/info/sparse-checkout"

# $1 Directory to backup.
function backup() {
    BACKUP="$1.backup"
    if [ -d $BACKUP ]; then
        echo "\"$BACKUP\" is not empty, maybe a backup has already been made?  The script is stopping, as I do not want to accidentally overwrite your configs.  Please rename or delete this directory."
        exit 0
    fi
    if [ -d $1 ]; then
        echo "Creating a backup of \"$1\" at \"$BACKUP\"."
        mv "$1" "$BACKUP"
    fi
}

# Create backups.
if [ "$1" == "force" ]; then
    echo "Forcing! Could override configs!"
else
    backup "$NVIM_DIR"
    backup "$WORK_TREE/.config/kitty"
    backup "$WORK_TREE/.config/fish"
    backup "$WORK_TREE/.config/tmux"
    backup "$WORK_TREE/.tmux"
fi

# Init repo.
mkdir -p "$GIT_DIR"
cd "$GIT_DIR" || exit
git init --bare
git remote add -f origin https://github.com/AlexvZyl/.dotfiles

# Prepare partial clone.
git config core.sparseCheckout true
touch "$SPARSE_FILE"
echo ".config/nvim/*" >> "$SPARSE_FILE"
echo ".config/fish/*" >> "$SPARSE_FILE"
echo ".config/kitty/*" >> "$SPARSE_FILE"
echo ".config/tmux/*" >> "$SPARSE_FILE"
echo ".tmux/*" >> "$SPARSE_FILE"

# Clone.
git --work-tree=$WORK_TREE --git-dir=$GIT_DIR checkout main
git --work-tree=$WORK_TREE --git-dir=$GIT_DIR pull origin main