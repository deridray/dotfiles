#!/bin/bash

# paths
DOTFILES="$HOME/dotfiles"
CONFIG_SRC="$HOME/.config"
CONFIG_DEST="$DOTFILES/config"
HOME_REPO="$DOTFILES/home"
LIST="$DOTFILES/.whitelist"

if [ ! -f "$LIST" ]; then
    echo " ❌ file $LIST not found!"
    exit 1
fi

echo " 🔍 [configs] processing whitelist..."

while IFS= read -r item || [ -n "$item" ]; do
    [[ -z "$item" || "$item" =~ ^# ]] && continue

    SOURCE="$CONFIG_SRC/$item"
    DEST="$CONFIG_DEST/$item"

    if [ -L "$SOURCE" ]; then
        continue
    fi

    if [ -e "$SOURCE" ]; then
        echo " 📦 moving $item to dotfiles/config..."
        mkdir -p "$CONFIG_DEST"
        mv "$SOURCE" "$DEST"
    elif [ -e "$DEST" ]; then
        echo " ℹ️ $item found in repo (will be linked)."
    else
        echo " ❓ $item not found in $CONFIG_SRC. skipping."
    fi

done < "$LIST"


echo " 🔗 [configs] linking files from ~/dotfiles/config to ~/.config..."
if [ -d "$CONFIG_DEST" ]; then
    stow -v -d "$DOTFILES" -t "$CONFIG_SRC" config
else
    echo " ⚠️ directory $CONFIG_DEST does not exist, skipping."
fi

echo " 🔗 [home] linking files from ~/dotfiles/home to ~/..."
if [ -d "$HOME_REPO" ]; then
    stow -v -d "$DOTFILES" -t "$HOME" home
else
    echo " ⚠️ directory $HOME_REPO does not exist, skipping."
fi

echo " ✅ done!"