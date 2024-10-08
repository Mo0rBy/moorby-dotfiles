# Mo0rBy's dotfiles

This repository contains files relevant to my development environment and other dotfiles that I want to to sync across multiple machines.

<!-- toc -->

- [Cross-application colourscheme](#cross-application-colourscheme)
- [WezTerm](#wezterm)
- [ZSH](#zsh)
  * [Setup](#setup)
- [Tmux](#tmux)
  * [Setup](#setup-1)
  * [Theming options](#theming-options)
  * [Plugins](#plugins)
- [Neovim](#neovim)
  * [Plugins](#plugins-1)
    + [Quality of life](#quality-of-life)
    + [UI modifications](#ui-modifications)
    + [Syntax highlighting](#syntax-highlighting)
    + [Auto-completion features](#auto-completion-features)
    + [Git](#git)
    + [Note Taking](#note-taking)
- [K9s](#k9s)
  * [Setup](#setup-2)
- [Extra CLI Tools](#extra-cli-tools)
- [Custom Scripts](#custom-scripts)

<!-- tocstop -->

## Cross-application colourscheme

I use the [Tokyonight Moon](https://github.com/folke/tokyonight.nvim) colourscheme.
I've experimented with a few different colourschemes and for now I have chosen Tokyonight because it is very well supported by many different applications.
This means that I don't have much trouble in getting it to work across all the different tools that I use and it makes my life much easier.

## WezTerm

I use [WezTerm](https://wezfurlong.org/wezterm/) for my terminal needs. 
It's written using Rust and utlises the GPU for it's rendering, resulting in a super fast experience.
I also love that all it's configuration and settings are set sing lua config files, just like with Neovim.

## ZSH

I use ZSH as my shell of choice as it has really nice customization options using oh-my-zsh and I love the autocomplete features it comes with.

### Setup

1. You need to install ZSH by following the instructions provided on the [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) Github repo, [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).
This should create some new files in your `$HOME` directory, namely the `.zshenv` and `.zshrc` files.

2. In order to use the ZSH configuration in this repo, you need to complete a few more steps.
Remove both `.zshenv` and `.zshrc` files that were generated when installing ZSH.
Next, symlink the `.zshenv` file: (this command assumes that this repo is cloned to `~/.config`, modify the command if required)
    ```sh
      ln -s ~/.config/zsh/.zshenv ~/.zshenv
    ```
    The `.zshenv` file in this repo contains some configuration that tells ZSH that the remaining config files are located in `$HOME/.config/zsh`.

    This repository has a git submodule for the oh-my-zsh repository and the included `.zshrc` has a line telling ZSH where the oh-my-zsh installation is located so there is no need to install it separately.

## Tmux

I use my terminal ALL the time. [Tmux](https://github.com/tmux/tmux) helps me to increase my productivity when in my terminal. The primary utility of Tmux is that it allows me to quickly switch between Neovim and a CLI terminal window.

### Setup

Install tmux using your preferred method.
I did not have any issues installing the latest version using the `apt` package manager like I did with alacritty.

To ensure that the `tmux/tmux.conf` file is loaded, open a tmux session and use the default keymap (`Ctrl+b`) and press `:` to enter the tmux command mode and execute `source-file ~/.config/tmux/tmux.conf` to load the config.
If the default `Ctrl+b` doesn't work, then try `Ctrl+a`, this is what I have it set to in my config.

Once the `tmux.conf` has been loaded for the first time, then you can use `Ctrl+a`, `r` to refresh the tmux config.

### Theming options

Tmux theming and colour configuration is all done within the `tmux.conf` file along with everything else.
I struggled a bit to find information on the different styling options and what they do and then I found [this video](https://www.youtube.com/watch?v=9e8850-1pg8) which made it quite easy to understand.
Another good thing to look at would be the [tmux man pages](https://man7.org/linux/man-pages/man1/tmux.1.html).
In my opinion, the tmux man pages aren't really clear in what the option is modifying, it would be useful to have some visual examples like images or videos, hence why I have added the link to the video above that shows what some of the option do really clearly.
I highly recommend playing with the options inside your `tmux.conf` file, just to get a feel for what the config option is doing and how it looks in your tmux.

### Plugins

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - adds useful keymaps for navigating splits within vim and tmux
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - saves tmux windows & sessions when machine is restarted
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - continuously auto-saves the state of tmux (works nicely with tmux-resurrect)

## Neovim

Neovim is an evolution of vi and vim. You can install many different plugins to make Neovim look and feel exactly as you want. I use it as my main code editor.

### Plugins

This is a list of all the plugins I use in my Neovim config.

#### Quality of life

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - adds useful keymaps for navigating splits within vim and tmux
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - a fuzzy finder plugin making it easier to find open buffers as well as files and text across directories, this has dependencies for:
    - [plenary](https://github.com/nvim-lua/plenary.nvim) - adds extra lua functions
    - [ripgrep](https://github.com/BurntSushi/ripgrep) - a tool that can recursively search across directories for a regex pattern
- [vim-illuminate](https://github.com/RRethy/vim-illuminate) - this plugin will highlight other instances of a word that the cursor is on
- [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank) - this plugin highlights what was just yanked (copied)
- [vim-maximizer](https://github.com/szw/vim-maximizer) - used to maximize (and return to normal) a split
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - makes it easier to see indentation (my configuration uses the `scope` too), this has dependencies for:
    - [indent-rainbowline](https://github.com/TheGLander/indent-rainbowline.nvim) - adds VSCode style rainbow indentation indiciators
    - [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) - adds rainbow bracket delimiters (`{}` and `()`)
- [comment](https://github.com/numToStr/Comment.nvim) - used for better commenting functionality, this has dependencies for:
    - [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - used for better commenting in files with multiple comment formats
- [vim-surround](https://github.com/tpope/vim-surround) - adds useful keymaps to modify textobject surroundings
- [cutlass](https://github.com/gbprod/cutlass.nvim) - modifies delete keys to use the blackhole register to make copy/paste/delete workflows easier
- [nvim-silicon](https://github.com/michaelrommel/nvim-silicon) - Adds nvim integration for Silicon code snapshot CLI tool
- [auto-session](https://github.com/rmagatti/auto-session) - adds session management functionality

#### UI modifications

- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - a file explorer plugin, I prefer it over the default netrw plugin
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - better icons for filetypes
- [dressing](https://github.com/stevearc/dressing.nvim) - modifies some UI elements for example, adding/renaming files in nvim-tree or inputs for LSP renaming
- [lualine](https://github.com/nvim-lualine/lualine.nvim) - adds a status line
- [noice]https://github.com/folke/noice.nvim) - adds different UI elements and more customisation to notifications, cmdline and searching
- [alpha](https://github.com/goolord/alpha-nvim) - adds a customizable greeting pane when you start neovim
- [nvim-pqf](https://github.com/yorickpeterse/nvim-pqf) - modifies the quickfix window and makes it easier to read

#### Syntax highlighting

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provides better syntax highlighting, this has dependencies for:
    - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - autoclose and autorename html tags
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) - this plugin is a language pack that adds syntax highlighting support for ~150 more languages. This includes adding `helm` filetypes which is one of the reasons I use it
- [tree-sitter-go-tempalte](https://github.com/ngalaiko/tree-sitter-go-template) - adds syntax highlighting for Go template filetypes

#### Auto-completion features

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - used for autocompletion snippets, this has dependencies for:
    - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - completion source from text in current buffer
    - [cmp-path](https://github.com/hrsh7th/cmp-path) - completion source from filesystem paths
    - [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - a snippet engine
    - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - completion source from snippet engines
    - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - snippets for various languages
    - [lspkind](https://github.com/onsails/lspkind.nvim) - nice icons for autocompletion
- [mason](https://github.com/williamboman/mason.nvim) - this is a plugin manager for LSP servers, this has dependencies for:
    - [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - this plugin makes it easier to use lspconfig with Mason 
- [lspconfig](https://github.com/neovim/nvim-lspconfig) - this plugin allows setup and configuration of LSP servers

#### Git

- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - adds git integration to buffers so you can see git changes + git blame etc
- [neogit](https://github.com/NeogitOrg/neogit) - adds neovim integration for git workflows, e.g. viewing diffs and committing changes, viewing git log/reflog, interactive rebasing, etc (same sort of thing as lazygit, but has a more intuative UI design and better configurability + keymapping)
- [diffview](https://github.com/sindrets/diffview.nvim) - adds a nice git diff view (like VSCode)

#### Note Taking
- [obsidian](https://github.com/epwalsh/obsidian.nvim) - adds neovim integration with [Obsidian app](https://obsidian.md/)

## K9s

As a DevOps Engineer / SRE, I interact with Kubernetes clusters literally all day, almost every day.
For this reason, I use the K9s terminal GUI as a great way to understand whatever is happening in a K8s cluster at any given time.
It's a very intuative UI with sensible keyboard shortcuts and you can add configuration options in a file just like alacritty and tmux!

### Setup

This one is pretty easy!
Just install K9s using your preferred method and it will automatically be setup to read it's config file inside the `$XDG_CONFIG_HOME/k9s` directory.
It really is as simple as that!

## Extra CLI Tools

Here is a list with the links to the relevant Github pages for CLI tools that I like to use in my setup.
My `.zshrc` file contains some aliases for these CLI tools, so you must make sure they are installed for these aliases to work correctly.

- [eza](https://github.com/eza-community/eza) (a better `ls` command)
- [bat](https://github.com/sharkdp/bat) (a better `cat` command)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (a better `cd` command)
- [fzf](https://github.com/junegunn/fzf) (a really nice fuzzyfinder tool)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (a better `grep` command)
- [sdkman](https://sdkman.io/) (helps to install and organize SDK's (JDK's, Maven, Gradle, etc))
- [pyenv](https://github.com/pyenv/pyenv) (tool that helps to manage multiple python versions)
- [silicon](https://github.com/Aloxaf/silicon) (allows you to take nice screenshots of code)
- [yazi](https://yazi-rs.github.io/) (a terminal file explorer (similar to Ranger)

## Custom Scripts

I am new to creating custom scripts for my workflows and for this reason I only have 2 currently.
All my custom scripts are stored in the `scripts` directory and more child directories exist here to categorize different scripts.

In the future, I will create a "setup script" that can be run to setup and install this entire dot-files repository.
The main point of this will be to create a number of symlinks and run installation commands (if possible).




---

Need to add a new part of the README that describes how to setup on a branch new machine:

1. symlink zshenv file
2. Install HomeBrew
3. Install Brew file with `brew bundle install --file=Brewfile`
4. git submodule update --init --recursive
5. Navigate to .config/zsh/.oh-my-zsh
6. Run tools/upgrade.sh
7. Install p10k (git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k) (config should be loaded automatically by restarting terminal)
8. Install SDKMan (curl -s "https://get.sdkman.io" | bash)

