#!/bin/bash

# Exit on error
set -e

echo "[+] Installing Zsh..."
sudo apt update && sudo apt install zsh curl git -y

echo "[+] Installing Oh My Zsh..."
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "[+] Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

echo "[+] Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "[+] Updating .zshrc plugins..."
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$HOME/.zshrc"

echo "[+] Setting Zsh as default shell for user $USER..."
chsh -s "$(which zsh)"

echo "[+] All done! Restart your terminal or run: source ~/.zshrc"
