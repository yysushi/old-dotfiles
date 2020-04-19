#!/bin/bash

USERNAME=koketani

# default bashrc
## For Linux
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc
## For Darwin
[[ -f /etc/bashrc ]] && source /etc/bashrc

# vi mode in bash
set -o vi

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim

# tmux
alias tmux='tmux -u'

# dev
DEV="$HOME/Developments"
export DEV

# cpp for make command and make built-in plugin in vim
export CXX="clang++"
export CXXFLAGS="-std=c++14 -Wall -Wextra -O2"
# export LDFLAGS

# python
[[ -d "$HOME"/.py37 ]] || virtualenv --python=python3.7 "$HOME"/.py37
source "$HOME"/.py37/bin/activate

# golang
export GOPATH="$HOME/.go"
export PATH=$PATH:/usr/local/go/bin:"$GOPATH/bin"

# ghq
export GHQ_ROOT="$HOME"/Developments/git

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# git completion and git prompt
[[ -f "$HOME"/.git-completion.bash ]] && source "$HOME"/.git-completion.bash
[[ -f "$HOME"/.git-prompt.sh ]] && source "$HOME"/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
export PROMPT_COMMAND='__git_ps1 "\[\033[01;34m\]$USERNAME\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]" "\\\$ "'

# java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$PATH":/opt/maven/bin

# base16 shell
BASE16_SHELL="$HOME"/.config/base16-shell/
[[ -n "$PS1" ]] && [[ -f "$BASE16_SHELL"/profile_helper.sh ]] && eval "$("$BASE16_SHELL"/profile_helper.sh)"

# nvm
export NVM_DIR="$HOME"/.nvm
## load nvm
[[ -f /usr/local/opt/nvm/nvm.sh ]] && source /usr/local/opt/nvm/nvm.sh
## load nvm bash_completion
[[ -f /usr/local/opt/nvm/etc/bash_completion.d/nvm ]] && source /usr/local/opt/nvm/etc/bash_completion.d/nvm

# npm
export PATH="$HOME"/.npm-global/bin:"$PATH"

# llvm
export PATH=/usr/local/opt/llvm/bin:"$PATH"

# bash completion
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && source /usr/local/etc/profile.d/bash_completion.sh

# fzf
[[ -f "$HOME"/.fzf.bash ]] && source "$HOME"/.fzf.bash

# rbenv
eval "$(rbenv init -)"

# google cloud sdk
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc

# pipx
# requisite: pip3 install pipx
mkdir -p "$HOME"/.pipx
export PIPX_HOME="$HOME"/.pipx/pipx
export PIPX_SHARED_LIBS="$HOME"/.pipx/shared
export PIPX_BIN_DIR="$HOME"/.pipx/bin
export PATH="$PATH":"$PIPX_BIN_DIR"
