#!/bin/bash

set -e

echo "==> Installing required packages..."
sudo apt update
sudo apt install -y ffmpeg p7zip-full jq poppler-utils fd-find ripgrep fzf zoxide imagemagick curl git build-essential

echo "==> Installing Rust using rustup..."
if ! command -v rustup &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rustup already installed."
    rustup update
fi

echo "==> Cloning Yazi repository..."
git clone https://github.com/sxyazi/yazi.git
cd yazi

echo "==> Building Yazi..."
cargo build --release --locked

echo "==> Installing Yazi binaries..."
sudo cp target/release/yazi /usr/local/bin/
sudo cp target/release/ya /usr/local/bin/

echo "==> Cleaning up..."
cd ..
rm -rf yazi

echo "✅ Yazi installation complete! You can now run 'yazi' from your terminal."
