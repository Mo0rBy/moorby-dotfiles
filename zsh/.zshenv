export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export GIT_CONFIG="$XDG_CONFIG_HOME/git/config"

. "$HOME/.cargo/env"

if [[ -r "$ZDOTDIR/.zshenv.local" ]]; then
    source "$ZDOTDIR/.zshenv.local"
fi
