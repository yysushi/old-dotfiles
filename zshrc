#!/bin/zsh

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim
bindkey -v
alias vim='nvim'

# no beep
setopt no_beep

# enable compinit and colors
# autoload -U compinit; compinit

# this order effect pass vs vagrant

# zinit {{{
#
# after updating, measure load time by "time ( zsh -i -c exit )"

source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps}  )) && _comps[zinit]=_zinit
autoload -U compinit; compinit
autoload -U colors; colors

# completion {{{
#
# output $fpath and find compdef file by "find $fpath -name _pass"
# please note compdef is overwritten by afterward fpath's definition
#
# 1. /usr/share/zsh/5.3/functions
# go, git, npm, tmux
# 2. /usr/local/share/zsh/site-functions
# brew, ghq, minikube, pass, pet, ag, tig, tmuxiantor
# 3. zsh-users/zsh_completion , ohmyzsh/ohmyzsh
# jmeter, mvn, node, nvm, openssl,
# scala, setup.py, tox, vagrant, kubectl
zinit wait lucid \
  atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions \
    OMZP::kubectl/kubectl.plugin.zsh
# zinit light zsh-users/zsh-completions
# 4. others (ohmyzsh/ohmyzsh, asdf-vm/asdf)
# asdf, cargo, docker, docker-compose, rustup, rust
zinit wait lucid \
  atload"zicompinit; zicdreplay" as"completion" blockf for \
    https://github.com/asdf-vm/asdf/blob/master/completions/_asdf \
    OMZP::cargo/_cargo \
    OMZP::docker/_docker \
    OMZP::docker-compose/_docker-compose \
    OMZP::rustup/_rustup \
    OMZP::rust/_rust
# }}}

# }}}

# # git completion and git prompt
# # https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh#L16
# [[ -f "$HOME"/.git-prompt.sh ]] && source "$HOME"/.git-prompt.sh
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto
# # setopt PROMPT_SUBST ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c$(__git_ps1 " (%s)")\$ '
# setopt promptsubst ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c$(__git_ps1 " (%s)")\$ '

#zinit wait'!' lucid for \
#  https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# zinit ice pick"git-prompt.sh"
# zinit light git/git
# zinit snippet https://github.com/git/git/tree/master/contrib/completion/git-prompt.sh

# git
# setopt promptsubst
# # setopt prompt_subst
# zinit wait lucid for \
#   OMZL::git.zsh \
#   OMZP::git-prompt
  # OMZP::git-prompt \
  # OMZT::fishy
  # OMZL::git.zsh \

# PS1=
# PS1="READY >"
# zinit wait'!' lucid for \
#   OMZL::prompt_info_functions.zsh
  # OMZL::prompt_info_functions.zsh \
  # OMZT::fishy

# PS1="aaa "

# setopt promptsubst ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c$(__git_ps1 " (%s)")\$ '
# setopt promptsubst ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} $(_fishy_collapsed_wd)$(__git_ps1 " (%s)")\$ '
# setopt promptsubst ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} $(_fishy_collapsed_wd)$(__git_ps1 " (%s)")\$ '
# precmd () { __git_ps1 "%{$fg[cyan]%}koketani:%{$reset_color%}" " $(_fishy_collapsed_wd)$ " "|%s"  }


_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

[[ -f "$HOME"/.git-prompt.sh ]] && source "$HOME"/.git-prompt.sh
# precmd () { __git_ps1 "%n" ":%~$ " "|%s"  }
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# setopt promptsubst ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c$(__git_ps1 " (%s)")\$ '
setopt promptsubst ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} $(_fishy_collapsed_wd)$(__git_ps1 " (%s)")\$ '
# precmd () { __git_ps1 "%n" ":%~$ " " (%s)"  }
# precmd () { __git_ps1 "%n" "" " (%s)$ "  }

# PROMPT='%n@%m %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.>) '
# zinit wait'!' lucid for \
  # OMZT::gnzh
  # atinit"PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c ($(git_current_branch) $(git_super_status))\$ '" \
# PROMPT='%B%m%~%b$(git_super_status) %# '
# PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c$(__git_ps1 " (%s)")\$ '
# PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c ($(git_current_branch) $(git_super_status))\$ '
  # OMZL::prompt_info_functions.zsh \
#   OMZT::gnzh

# PROMPT=wei
# PS1=$(git_super_status)
# PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c ($(git_current_branch) $(git_super_status))\$ '


# binary: fzf, asdf, gcloud
# completion: direnv, gcloud, rbenv
# git prompt

# zinit _local/

# zinit wait lucid for \
#   OMZP::git-prompt
# zinit wait lucid for \
#   OMZP::git


# # time ( zsh -i -c exit  )
# zinit ice svn wait"0" silent as"command"
# zinit snippet OMZP::shrink-path


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
# [[ -f "$HOME"/.git-prompt.sh ]] && source "$HOME"/.git-prompt.sh
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto
# setopt PROMPT_SUBST ; PS1='%{$fg[cyan]%}koketani:%{$reset_color%} %c$(__git_ps1 " (%s)")\$ '

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
# [ -s "$NVM_DIR"/zsh_completion  ] && \. "$NVM_DIR"/zsh_completion  # This loads nvm zsh_completion

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

# time ( zsh -i -c exit  )
# zinit ice svn wait"0" silent as"null"
# zinit snippet OMZP::git-prompt

# zinit light-mode lucid for OMZP::git-prompt
# zinit light-mode lucid for OMZP::git

# PROMPT='%B%m%~%b$(git_super_status) %# '

# zinit snippet OMZP::git
# zinit for \
#         light-mode OMZP::git-prompt
#

# zinit wait lucid light-mode for \
#   OMZP::kubectl
# zinit wait lucid light-mode for \
#   atinit"zicompinit; zicdreplay"  \
#     zdharma/fast-syntax-highlighting
