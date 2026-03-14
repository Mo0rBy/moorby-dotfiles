#!/bin/zsh

echo "--- apt update & upgrade ---"
sudo apt update -y
sudo apt upgrade -y

echo "--- snap refresh ---"
sudo snap refresh

echo "--- brew update & upgrade ---"
brew update
brew upgrade
