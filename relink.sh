#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/Documents/projects/ProjectFishy/dotfiles"
CONFIG_DIR="$HOME/.config"

echo "🔁 Syncing dotfiles from: $DOTFILES_DIR"

find "$DOTFILES_DIR" -type f -o -type d | while read -r src_path; do
    # Get relative path from dotfiles/config
    rel_path="${src_path#$DOTFILES_DIR/}"
    dest_path="$CONFIG_DIR/$rel_path"

    # Remove existing file or symlink at destination (but not dirs!)
    if [ -f "$dest_path" ] || [ -L "$dest_path" ]; then
        echo "🧹 Removing existing file: $dest_path"
        rm -f "$dest_path"
    fi

    # Make sure destination directory exists
    mkdir -p "$(dirname "$dest_path")"

    # Symlink only files (ignore dirs)
    if [ -f "$src_path" ]; then
        ln -s "$src_path" "$dest_path"
        echo "🔗 Linked: $rel_path"
    fi
done

echo "✅ Done syncing dotfiles."
