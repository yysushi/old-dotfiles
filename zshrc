#!/bin/zsh

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim
bindkey -v

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

# zplug {{{

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"

zplug "plugins/asdf",           from:oh-my-zsh
# zplug "plugins/direnv",         from:oh-my-zsh
# zplug "plugins/docker",         from:oh-my-zsh
# zplug "plugins/docker-compose", from:oh-my-zsh
# zplug "plugins/fzf",            from:oh-my-zsh
zplug "plugins/git",            from:oh-my-zsh
# zplug "plugins/golang",         from:oh-my-zsh
zplug "plugins/kubectl",        from:oh-my-zsh
# zplug "plugins/minikube",       from:oh-my-zsh
zplug "plugins/pass",           from:oh-my-zsh
# zplug "plugins/python",         from:oh-my-zsh
# zplug "plugins/pip",            from:oh-my-zsh
# zplug "plugins/npm",            from:oh-my-zsh
# zplug "plugins/nvm",            from:oh-my-zsh
# zplug "plugins/sudo",           from:oh-my-zsh
# zplug "plugins/terraform",      from:oh-my-zsh
# zplug "plugins/tig",            from:oh-my-zsh
zplug "plugins/tmux",           from:oh-my-zsh
zplug "plugins/vagrant",        from:oh-my-zsh
# zplug "plugins/virtualenv",     from:oh-my-zsh

zplug load

# }}}

# # git completion and git prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh#L16
[[ -f "$HOME"/.git-prompt.sh ]] && source "$HOME"/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# setopt PROMPT_SUBST ; PS1='[%n %c$(__git_ps1 " (%s)")]\$ '
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
