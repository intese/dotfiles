# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails2 git ruby bundler osx fu)

# bindkey for backward search (doesn't work per default in vi-mode)
#bindkey -v
#bindkey '\e[3~' delete-char
#bindkey '^R' history-incremental-search-backward

# export FUCHS_DEV=$HOME/Sites/fuchs
# Customize to your needs...
export PATH="./bin:/Users/aharder/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/oracle/instantclient_11_2:/usr/local/bin:/opt/X11/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:$PATH"
# Initialise rbenv
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Oracle Development: ruby-oci8
export NLS_LANG=GERMAN_GERMANY.UTF8
export NLS_COMP=LINGUISTIC
export NLS_SORT=BINARY_CI
source $ZSH/oh-my-zsh.sh
export OCI_DIR=/opt/oracle/instantclient_11_2

VIM_EDITOR_NORC='vim -u NORC'
EDITOR="$HOME/.std_editor"; export EDITOR

# Activate vi mode
set -o vi

# Map history backward search (Ctrl-R in emacs mode) to [command-mode]?
bindkey '^R' history-incremental-pattern-search-backward

alias v='vim'
alias gti=git
alias gt=gittower -s .
alias cleanup-local-branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

mvim_fc() {
  mvim $(git status | grep 'both modified' |cut -d: -f2 | head -1)
}
rslv_fc() {
  git add $(git status | grep 'both modified' |cut -d: -f2 | head -1)
}

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Fix numeric keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
