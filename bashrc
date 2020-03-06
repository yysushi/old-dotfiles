#!/bin/bash

USERNAME=koketani

# default bashrc
## For Linux
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
## For Darwin
[ -f /etc/bash ] && source /etc/bash

# vi mode in bash
set -o vi

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim

# tmux
alias tmux='tmux -u'
mkdir -p "$HOME/.tmux/log"

# venv configuration
global_venv="$HOME/.global-venv"
venvs_dir="$HOME/.venvs"
test -d "${global_venv}"
installed=$?
if [ 0 -ne $installed ]; then
        echo "### create global venv at ${global_venv}"
	python3 -m venv "${global_venv}"
fi
source "${global_venv}/bin/activate"
if [ 0 -ne $installed ]; then
	echo "### install packages for global venv"
	python -m pip install --user -r "$HOME/.dotfiles/global-requirements.txt"
fi
mkdir -p "${venvs_dir}"
## create alway project environment for pipenv
export PIPENV_IGNORE_VIRTUALENVS=1

# dev
export DEV="$HOME/Developments"
mkdir -p "$DEV"

# cpp for make command and make built-in plugin in vim
export CXX="clang++"
export CXXFLAGS="-std=c++14 -Wall -Wextra -O2"
# export LDFLAGS

# golang
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
gvm use go1.13 > /dev/null
export GOPATH="$HOME/Developments/go"
export PATH="$PATH":"$GOPATH/bin"

# ghq
export GHQ_ROOT="$HOME/Developments/git"

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
export PROMPT_COMMAND='__git_ps1 "\[\033[01;34m\]$USERNAME\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]" "\\\$ "'

# java
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$PATH":/opt/maven/bin

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# npm
export PATH="$HOME/.npm-global/bin":$PATH

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# fzf
[ -f "$HOME/fzf.bash" ] && source "$HOME/.fzf.bash"

# rbenv
eval "$(rbenv init -)"

# google cloud sdk
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
