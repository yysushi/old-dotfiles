#!/bin/bash

# default bashrc
export PLATFORM=$(uname -s)
[ -f /etc/bashrc ] && source /etc/bashrc

# vi mode in bash
set -o vi

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim

# tmux
alias tmux='tmux -u'
mkdir -p "$HOME"/.tmux/log

# virtualenv configuration
export WORKON_HOME="$HOME"/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
## pip3 install virtualenvwrapper \
## && mkvirtualenv global --python=python3 \
## && pip install -r "$HOME"/.dotfiles/global-requirements.txt
[[ -s "$WORKON_HOME"/global ]] && source "$WORKON_HOME"/global/bin/activate && source virtualenvwrapper.sh

# dev
export DEV="$HOME"/Developments
mkdir -p "$DEV"

# cpp for make command and make built-in plugin in vim
export CXX="clang++"
export CXXFLAGS="-std=c++14 -g -Wall -Wextra -O2"
# export LDFLAGS

# golang
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
gvm use go1.13 > /dev/null
export GOPATH="$HOME"/Developments/go
export PATH="$PATH":"$GOPATH"/bin

# ghq
export GHQ_ROOT="$HOME"/Developments/git
export GHQ_ROOT="$GHQ_ROOT":"$GOPATH"/src

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# npm
export PATH=~/.npm-global/bin:$PATH
