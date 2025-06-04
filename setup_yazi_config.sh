#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/yazi"

echo "==> Creating Yazi config directory..."
mkdir -p "$CONFIG_DIR"

echo "==> Creating config files..."
touch "$CONFIG_DIR/yazi.toml"
touch "$CONFIG_DIR/keymap.toml"
touch "$CONFIG_DIR/theme.toml"

echo "==> Setting nano as default editor..."

SHELL_RC=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

if ! grep -q 'export EDITOR=nano' "$SHELL_RC"; then
    echo 'export EDITOR=nano' >> "$SHELL_RC"
    echo "Added 'export EDITOR=nano' to $SHELL_RC"
else
    echo "'EDITOR=nano' is already set in $SHELL_RC"
fi

echo "✅ Yazi config directory and files created."
echo "💡 Restart your terminal or run 'source $SHELL_RC' to apply the editor change."
