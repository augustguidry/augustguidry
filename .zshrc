# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="apple"

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
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
  asdf
	copyfile
	git 
	github
	npm
	pass
	pip
	pod
	rails
	rake
	ruby
	thefuck
	vi-mode
	vscode
	web-search
	xcode
	z
	zsh-interactive-cd
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Zsh .compdumpfiles
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Oh My Zsh, omz
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# thefuck, fuck
eval $(thefuck --alias)

# machine dependency
if [[ "$(uname -m)" == "x86_64" ]]; then
    # Intel Mac configurations
    export PATH=/usr/local/bin:$PATH
elif [[ "$(uname -m)" == "arm64" ]]; then
    # ARM Mac configurations
    export PATH=/opt/homebrew/bin:$PATH
fi

# XDG standard directory declarations
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_RUNTIME_DIR="$HOME/run/user/$UID"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_VIDEOS_DIR="$HOME/Movies"

# exports
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}/asdf/asdfrc"
export ASDF_DATA_DIR="${XDG_DATA_HOME}/asdf"
export EDITOR=nvim
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export FISH_HISTORY_FILE="XDG_STATE_HOME"/fish/history
export GEM_HOME="${XDG_DATA_HOME}"/gem
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}"/gem
export GNUPGHOME="$XDG_DATA_HOME/"gnupg
export HISTFILE="$XDG_STATE_HOME"/bash/history
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NVM_DIR="$XDG_DATA_HOME"/nvm
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export TLDR_CACHE_DIR="$XDG_CACHE_HOME/tldrc"
export VISUAL=nvim
export ZDOTDIR="$HOME"/.config/zsh
export _Z_DATA="$XDG_DATA_HOME/z"

# this loads nvm bash completion
# this loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
 
# alias
alias abook=abook --config $XDG_CONFIG_HOME/abook/abookrc --datafile "$XDG_DATA_HOME"/abook/addressbook
alias ls=eza
alias monerod=monerod --data-dir "$XDG_DATA_HOME"/bitmonero
alias ohmyzsh="mate ~/.oh-my-zsh"
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
