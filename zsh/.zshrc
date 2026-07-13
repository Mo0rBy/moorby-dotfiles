# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/zsh/.oh-my-zsh"

# Required for HomeBrew to work correctly
# Needs to be executed early on for terminal enviornment to launch and work correctly
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
)

# Plugin configuration
# Plugin config variables must go here (before sourcing oh-my-zsh.sh)
ZSH_TMUX_AUTOSTART=true

# Skip oh-my-zsh's completion security audit (compaudit). Safe on a single-user
# machine and avoids an extra fpath scan on every startup.
ZSH_DISABLE_COMPFIX=true

# Speed up completion init. oh-my-zsh calls `compinit` with no caching, which
# rebuilds the ~50KB completion dump on EVERY startup (~700ms). This shim
# intercepts that call (oh-my-zsh's `autoload -U compinit` does not override an
# already-defined function) and instead trusts the cached dump via `compinit -C`
# (~20ms), only doing a full rebuild when the dump is missing or >24h old.
compinit() {
  unfunction compinit
  autoload -Uz compinit
  # Glob qualifiers must be evaluated in a filename-generation context (not in
  # [[ ]]); this array is non-empty only when the dump is older than 24h.
  local -a stale
  setopt local_options extended_glob
  stale=( "${ZSH_COMPDUMP}"(#qN.mh+24) )
  if [[ -f "$ZSH_COMPDUMP" && ${#stale} -eq 0 ]]; then
    compinit -C -d "$ZSH_COMPDUMP"   # fresh dump: trust it, skip the rescan
  else
    compinit -i -d "$ZSH_COMPDUMP"   # missing or stale (>24h): full rebuild
  fi
}

# Enabled zsh-completions installed with HomeBrew
# (needs to be done before sourcing oh-my-zsh)
# if type brew &>/dev/null; then
#   FPATH=$FPATH:$(brew --prefix)/share/zsh-completions
#
#   autoload -U compinit && compinit -i
# fi
# (leaving this out for now, as I don't really need it)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Set keybinds for natural text editing
# Linux keybinds
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;5D" beginning-of-line
bindkey "^[[1;5C" end-of-line
# MacOS keybinds are the same, however, "Command + LeftArrow" & "Option + LeftArrow" result in the same hex code.
# Therefore, cannot use "beginning-of-line" & "end-of-line" correctly.

# Additional CLI tools required setup
# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# Aliases for eza (better ls)
alias ld="eza -lD" # lists only directories (no files)
alias lf="eza -lF --color=always | grep -v /" # lists only files (no directories)
alias lh="eza -dl .* --group-directories-first" # lists only hidden files (no directories)
alias ll="eza -al --group-directories-first" # lists everything with directories first
alias ls="eza -alF --color=always --sort=size | grep -v /" # lists only files sorted by size
alias lt="eza -al --sort=modified" # lists everything sorted by time updated

# Activate sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Activate pyenv — lazy-loaded to keep shell startup fast.
# `python` is managed by mise (activated below); pyenv's own init is deferred
# until the first time you actually run `pyenv`, at which point this stub
# replaces itself with the real thing.
if command -v pyenv >/dev/null 2>&1; then
  pyenv() {
    unset -f pyenv
    eval "$(command pyenv init -)"
    pyenv "$@"
  }
fi

# Activate zsh-autosuggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom aliases
alias nn="nvim -c NewNote"

# Yazi function to change current directory to selected
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

alias ":q"="exit"

export PATH=$PATH:$(go env GOPATH)/bin # Add go bin to PATH

export KIND_EXPERIMENTAL_PROVIDER=podman # Set Kind to use Podman provider

# Load 'nvm' (node version manager) — lazy-loaded to keep shell startup fast.
# Eagerly sourcing nvm ran `nvm_auto` on every startup (~1.9s). `node`/`npm`
# are provided by mise, so we only stub the `nvm` command itself: the first
# time you run `nvm`, this replaces itself with the real nvm (which sources
# nvm.sh, applying any .nvmrc auto-use at that point) and re-runs your command.
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  nvm() {
    unset -f nvm
    \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # nvm bash completion
    nvm "$@"
  }
fi

# TODO: Create a conditional to check ohmyzsh is installed, if not, install it
eval "$(mise activate zsh)"
