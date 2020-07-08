#!/bin/zsh

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim
bindkey -v

# no beep
setopt no_beep

# enable compinit and colors
autoload -U compinit; compinit
autoload -U colors; colors

# zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zsh plugins managed by zinit
zinit light zsh-users/zsh-autosuggestions
zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions

# # time ( zsh -i -c exit  )
# zinit ice svn wait"0" silent as"command"
# zinit snippet OMZP::shrink-path

# time ( zsh -i -c exit  )
# zinit ice svn wait"0" silent as"command"
# zinit snippet OMZP::git-prompt
# PROMPT='%B%m%~%b$(git_super_status) %# '

# zinit snippet OMZP::git
# zinit for \
#         light-mode OMZP::git-prompt

# tmux
alias tmux='tmux -u'

# for mac
# overwrite posix commands with gnu's ones
command -v gsed > /dev/null 2>&1 && alias sed='gsed'
command -v ggrep > /dev/null 2>&1 && alias grep='ggrep'

# dev
DEV="$HOME/Developments"
export DEV

# cpp for make command and make built-in plugin in vim
export CXX="clang++"
export CXXFLAGS="-std=c++14 -Wall -Wextra -O2"
# export LDFLAGS

# pipenv
export PIPENV_IGNORE_VIRTUALENVS=1

# ghq
export GHQ_ROOT="$HOME"/Developments/git

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# # git completion and git prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh#L16
[[ -f "$HOME"/.git-prompt.sh ]] && source "$HOME"/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c$(__git_ps1 " (%s)")\$ '

# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

# java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$PATH":/opt/maven/bin

# base16 shell
BASE16_SHELL="$HOME"/.config/base16-shell/
[[ -n "$PS1" ]] && [[ -f "$BASE16_SHELL"/profile_helper.sh ]] && eval "$("$BASE16_SHELL"/profile_helper.sh)"

# nvm
export NVM_DIR="$HOME"/.nvm
[ -s "$NVM_DIR"/nvm.sh  ] && \. "$NVM_DIR"/nvm.sh  # This loads nvm
[ -s "$NVM_DIR"/zsh_completion  ] && \. "$NVM_DIR"/zsh_completion  # This loads nvm zsh_completion

# npm
export PATH="$HOME"/.npm-global/bin:"$PATH"

# llvm
export PATH=/usr/local/opt/llvm/bin:"$PATH"

# bash completion
# $(brew --prefix)/etc/bash_completion.d
# [[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && source /usr/local/etc/profile.d/bash_completion.sh

# fzf
[[ -f "$HOME"/.fzf.zsh ]] && source "$HOME"/.fzf.zsh

# google cloud sdk
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# asdf
[[ -f "$HOME"/.asdf/asdf.sh ]] && source "$HOME"/.asdf/asdf.sh
[[ -f "$HOME"/.asdf/completions/asdf.zsh ]] && source "$HOME"/.asdf/completions/asdf.zsh

# golang
GOPATH=$(go env GOPATH)
export GOPATH
export PATH="$PATH":"$GOPATH"/bin

# pip
export PIP_REQUIRE_VIRTUALENV=true

# pipx
export PATH="$PATH":"$HOME"/.pipx/bin

# venv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# direnv
eval "$(direnv hook zsh)"
