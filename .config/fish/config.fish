# config.fish file of August Guidry

# VI key bindings
function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fish prompt
function fish_prompt
    set_color cyan
    echo -n " "
    set_color normal
    echo -n (prompt_pwd)
    set_color yellow
    echo -n (fish_git_prompt)
    set_color normal
    echo -n " "
end

# machine dependency
if test (uname -m) = x86_64
    # Intel Mac configurations
    set -x PATH /usr/local/bin $PATH
    source /usr/local/opt/asdf/libexec/asdf.fish
else if test (uname -m) = arm64
    # ARM Mac configurations
    set -x PATH /opt/homebrew/bin $PATH
    source /opt/homebrew/bin/asdf/libexec/asdf.fish
end

# XDG standard directory declarations
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_DOCUMENTS_DIR "$HOME/Documents"
set -x XDG_DOWNLOAD_DIR "$HOME/Downloads"
set -x XDG_MUSIC_DIR "$HOME/Music"
set -x XDG_PICTURES_DIR "$HOME/Pictures"
set -x XDG_RUNTIME_DIR "$HOME/run/user/$UID"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_VIDEOS_DIR "$HOME/Movies"

# exports
set -x ASDF_CONFIG_FILE "$XDG_CONFIG_HOME/asdf/asdfrc"
set -x ASDF_DATA_DIR "$XDG_DATA_HOME/asdf"
set -x EDITOR nvim
set -x ELECTRUMDIR "$XDG_DATA_HOME/electrum"
set -x FISH_HISTORY_FILE "$XDG_STATE_HOME/fish/history"
set -x GEM_HOME "$XDG_DATA_HOME/gem"
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x HISTFILE "$XDG_STATE_HOME/bash/history"
set -x HISTFILE "$XDG_STATE_HOME/zsh/history"
set -x LESSHISTFILE "$XDG_CACHE_HOME/less/history"
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"
set -x NVM_DIR "$XDG_DATA_HOME/nvm"
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/pass"
set -x TLDR_CACHE_DIR "$XDG_CACHE_HOME/tldrc"
set -x VISUAL nvim
set -x ZDOTDIR "$HOME/.config/zsh"
set -x _Z_DATA "$XDG_DATA_HOME/z"

# this loads nvm bash completion
# this loads nvm
if test -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
    source "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
end
if test -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
    source "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
end

# alias
alias abook='abook --config $XDG_CONFIG_HOME/abook/abookrc --datafile "$XDG_DATA_HOME/abook/addressbook"'
alias ls='eza'
alias monerod='monerod --data-dir "$XDG_DATA_HOME/bitmonero"'
alias ohmyzsh='mate ~/.oh-my-zsh'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# fuck
thefuck --alias | source
