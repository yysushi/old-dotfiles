# vim: set foldmethod=marker foldlevel=0 nomodeline:

# zinit {{{
#
# after updating, measure load time by "time ( zsh -i -c exit )"

autoload -U colors; colors

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps}  )) && _comps[zinit]=_zinit

# }}}

# alias {{{

# nvim
alias vim='nvim'
alias view='nvim -R'
alias vimdiff='nvim -d'

# for mac
# overwrite posix commands with gnu's ones
command -v gsed > /dev/null 2>&1 && alias sed='gsed'
command -v ggrep > /dev/null 2>&1 && alias grep='ggrep'

# git
# alias can be printed by `alias -L | grep "='git"`
zinit wait lucid for \
  OMZL::git.zsh \
  OMZP::git

# }}}

# completion {{{

# output $fpath and find compdef file by "find $fpath -name _pass"
# please note compdef is overwritten by afterward fpath's definition

# 1. /usr/share/zsh/5.3/functions
# go, git, npm, tmux

# 2. /usr/local/share/zsh/site-functions
# pass, pet, ag, tig, tmuxiantor
# kind https://github.com/kubernetes-sigs/kind/blob/master/pkg/cmd/kind/completion/completion.go#L52

# 3. zsh-users/zsh_completion , ohmyzsh/ohmyzsh
# jmeter, mvn, node, nvm, openssl,
# scala, setup.py, tox, vagrant, kubectl
zinit wait lucid \
  atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions \
    OMZP::kubectl/kubectl.plugin.zsh

# 4. others (ohmyzsh/ohmyzsh, asdf-vm/asdf)
# asdf, cargo, docker, docker-compose, rustup, rust
zinit wait lucid \
  atload"zicompinit; zicdreplay" as"completion" blockf for \
    https://github.com/asdf-vm/asdf/blob/master/completions/_asdf \
    OMZP::docker/_docker \
    OMZP::docker-compose/_docker-compose \
    OMZP::rust/_rustc

# 5. manual
# cue, kind
 
# }}}

# prompt {{{

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

# TODO: make faster
zinit load agkozak/agkozak-zsh-prompt
setopt promptsubst
AGKOZAK_CUSTOM_PROMPT=''
# username
AGKOZAK_CUSTOM_PROMPT+='%F{magenta}yysushi%1v:%f '
# path
AGKOZAK_CUSTOM_PROMPT+='$(_fishy_collapsed_wd)'
# git status
AGKOZAK_CUSTOM_PROMPT+=$'%(6V. (%16>>%6v%>>%(7V. %7v.)).)'
# prompt character
AGKOZAK_CUSTOM_PROMPT+='\$ '
# no right prompt
AGKOZAK_CUSTOM_RPROMPT=''
# symbols
# ref1: agkozak ( '&*' '&' '*' '+' 'x' '!' '>' '?' '$' )
# ref2: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh#L38-L58
# Diverged, Behind, Ahead, New file(s), Deleted, Modified, Renamed, Untracked, Stashed changes
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' 'S' )

# }}}

# others {{{

# local path
export PATH="$PATH":/usr/local/bin
export PATH="$PATH":/opt/homebrew/bin

# local tools installed by npm
export PATH="$PATH":"$HOME"/.dotfiles/packages/npm/node_modules/.bin

# display
[[ -v WSLENV ]] \
&& LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}') \
&& export DISPLAY=$LOCAL_IP:0

# editor
export EDITOR=vim
bindkey -v

# docker
# enable buildkit for docker/compose
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
# disable synk test
export DOCKER_SCAN_SUGGEST=false

# no beep
setopt no_beep

# auto cd
setopt auto_cd

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# base16 shell
BASE16_SHELL="$HOME"/.config/base16-shell/
[[ -n "$PS1" ]] && [[ -f "$BASE16_SHELL"/profile_helper.sh ]] && eval "$("$BASE16_SHELL"/profile_helper.sh)"

# atcoder
export CARGO_ATCODER_TEST_CONFIG_DIR="$HOME"/.config

# }}}

# history 1 {{{

zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1

setopt appendhistory
HISTFILE=~/.zsh_history
HISTSIZE=100

# }}}

# tools {{{

# asdf
[[ -f "$HOME"/.asdf/asdf.sh ]] && source "$HOME"/.asdf/asdf.sh
[[ -f "$HOME"/.asdf/completions/asdf.zsh ]] && source "$HOME"/.asdf/completions/asdf.zsh

# direnv
eval "$(direnv hook zsh)"

# fzf
# generate config by $(asdf where fzf)/install
[[ -f "$HOME"/.fzf.zsh ]] && source "$HOME"/.fzf.zsh

# ghq
export GHQ_ROOT="$HOME"/git

# google cloud sdk
[[ -d "$HOME"/.asdf/installs/gcloud ]] && source "$(asdf where gcloud)"/completion.zsh.inc
[[ -d "$HOME"/.asdf/installs/gcloud ]] && source "$(asdf where gcloud)"/path.zsh.inc


# # PHP 8 requires the latter bison, but we have still error...
# export PATH="/usr/local/opt/bison/bin:$PATH"

# nvm
export NVM_DIR="$HOME"/.nvm
export NVM_LAZY_LOAD=true
zinit light lukechilds/zsh-nvm

# pip
export PIP_REQUIRE_VIRTUALENV=true

# pipenv
export PIPENV_IGNORE_VIRTUALENVS=1

# pipx
export PATH="$PATH":"$HOME"/.local/bin

# rancher desktop
export PATH="$PATH":"$HOME"/.rd/bin

# venv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox
export VAGRANT_EXPERIMENTAL="cloud_init,disks"

# z
zinit load agkozak/zsh-z

# }}}

# development {{{

# cpp
export CXX="clang++"
export CXXFLAGS="-std=c++14 -Wall -Wextra -O2"
# export LDFLAGS

# golang
# use GOPATH set by asdf
export PATH="$PATH":"$(go env GOPATH)"/bin

# llvm
export PATH=/usr/local/opt/llvm/bin:"$PATH"

# java
source ~/.asdf/plugins/java/set-java-home.zsh
export PATH="$PATH":/opt/maven/bin

# }}}

# history 2 {{{

bindkey '^N' autosuggest-accept

# }}}
