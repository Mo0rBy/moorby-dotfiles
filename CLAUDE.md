# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

Personal dotfiles, cloned directly to `~/.config` (`$XDG_CONFIG_HOME`). There is no build or test suite. Changes take effect when the relevant tool reloads its config.

## Tracking model

`.gitignore` ignores everything at the root (`/*`) and then re-includes specific directories with `!dir/` and `!dir/**`. A new top-level directory or file is invisible to git until a matching unignore entry is added to `.gitignore`. Anything matching `**/*.local` is never committed: machine-specific overrides live there (for example `zsh/.zshenv.local`, which `.zshenv` sources if present). `brewfiles/work.Brewfile` and `nvim/lazy-lock.json` are also ignored.

Third-party code is pulled in as shallow git submodules (see `.gitmodules`): oh-my-zsh, powerlevel10k, tpm, and the yazi tokyo-night flavor. Do not edit files inside them.

```sh
git submodule update --init --recursive
```

## Commands

```sh
nvim --headless "+Lazy! sync" +qa                 # install/update Neovim plugins
brew bundle install --file=brewfiles/<name>.Brewfile
scripts/macos/update.sh                            # brew update/upgrade, Lazy sync, macOS update
pre-commit run --all-files                         # regenerates the README table of contents (markdown-toc)
```

The README has a `<!-- toc -->` block maintained by the `markdown-toc` pre-commit hook; do not edit it by hand.

## Shell bootstrap

`~/.zshenv` is a symlink to `zsh/.zshenv`, which sets `XDG_CONFIG_HOME`, points `ZDOTDIR` at `zsh/` and `GIT_CONFIG` at `git/config`. All other zsh config is loaded from `zsh/`. `zsh/.zshrc` uses oh-my-zsh from the submodule with the powerlevel10k theme (`zsh/.p10k.zsh`).

Shell startup time has been deliberately optimised. Preserve these patterns when editing `.zshrc`:
- `nvm` and `pyenv` are lazy stubs that load the real tool on first call; mise (`mise/`) is the actual version manager for node and python.
- A `compinit` shim is defined before sourcing oh-my-zsh so the completion dump is reused unless it is missing or older than 24h.

## Neovim layout

`nvim/init.lua` loads `moorby.core` (keymaps, options, filetypes) and then `moorby.lazy` (lazy.nvim bootstrap). lazy.nvim defaults every plugin to `lazy = true`, so new plugin specs need an explicit trigger (`event`, `cmd`, `keys`, `ft`) or `lazy = false`.

Plugin specs are one file per plugin, returning a lazy.nvim spec table. lazy.nvim only imports these directories, so a spec in any other subdirectory will not load unless that directory is added to the `import` list in `nvim/lua/moorby/lazy.lua`:
- `moorby/plugins/` (uncategorised)
- `moorby/plugins/{appearance,explorer,git,lsp,qol}/`

`moorby/plugins/snacks/` is not imported; it holds per-module option tables that `snacks.nvim.lua` `require`s. Filetype-specific settings live in `nvim/after/ftplugin/`.

When adding or removing a Neovim plugin, update the matching category list in `README.md`.

## Theming

Tokyonight (Moon variant) is the shared colourscheme across Neovim, WezTerm, tmux, k9s, and yazi. Match it when configuring a new tool.
