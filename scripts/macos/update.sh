#!/bin/zsh

echo "--- BREW UPDATE ---"
brew update
echo "--- BREW UPGRADE ---"
brew upgrade

echo "--- NVIM LAZY SYNC ---"
nvim --headless "+Lazy! sync" +qa

echo "--- MACOS UPGRADE ---"
sudo softwareupdate -ia --restart
