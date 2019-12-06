#!/bin/bash

# vi mode in bash
set -o vi

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=nvim

# alias
alias view='nvim -R'

# tmux
alias tmux='tmux -u'
mkdir -p "$HOME"/.tmux/log

# virtualenv configuration
export WORKON_HOME="$HOME"/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
. "$HOME"/Library/Python/3.7/bin/virtualenvwrapper.sh

export PATH=$PATH:"$HOME"/Library/Python/3.7/bin

# dev
export DEV="$HOME"/Developments
mkdir -p "$DEV"

# cpp for make command and make built-in plugin in vim
export CXX="clang++"
export CXXFLAGS="-std=c++14 -g -Wall -Wextra -O2"
# export LDFLAGS

# golang
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
source "$HOME"/.gvm/scripts/gvm
gvm use go1.13 > /dev/null
export GOPATH="$HOME"/Developments/go
export PATH="$PATH":"$GOPATH"/bin

# ghq
export GHQ_ROOT="$HOME"/Developments/git
export GHQ_ROOT="$GHQ_ROOT":"$GOPATH"/src

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# locale
export LC_ALL=C

# git completion and git prompt
[[ -s "$HOME/.git-completion.bash" ]] && source "$HOME/.git-completion.bash"
[[ -s "$HOME/.git-prompt.sh" ]] && source "$HOME/.git-prompt.sh"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
export PROMPT_COMMAND='__git_ps1 "\[\033[01;34m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]" "\\\$ "'

# java
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$PATH":/opt/maven/bin

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# npm
export PATH=~/.npm-global/bin:$PATH

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
