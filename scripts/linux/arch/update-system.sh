#!/bin/zsh

echo "--- pacman update & upgrade ---"
( set -x; sudo pacman -Syu )

echo "--- pyenv update ---"
( set -x; pyenv update )

echo "--- sdkman update ---"
( set -x; sdk selfupdate )
