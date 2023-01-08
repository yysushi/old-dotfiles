# vim: set foldmethod=marker foldlevel=0 nomodeline:

# sheldon {{{

# PURE_PROMPT_SYMBOL="^"
# # prompt pure
# prompt_newline='%666v'
# # PROMPT=" $PROMPT"
AGKOZAK_FORCE_ASYNC_METHOD=zsh-defer
_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

AGKOZAK_CUSTOM_PROMPT=''
# username
AGKOZAK_CUSTOM_PROMPT+='%F{green}${USERNAME}%1v:%f '
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

eval "$(sheldon source)"

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

# }}}

# completion {{{

# }}}

# prompt {{{

# }}}

# others {{{

# skip using tmux-256color in mac osx since the package ncurse is too old..
# ref: https://github.com/tmux/tmux/issues/2262
# export TERM=screen-256color

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

# atcoder
export CARGO_ATCODER_TEST_CONFIG_DIR="$HOME"/.config

# }}}

# history 1 {{{

# }}}

# tools {{{

# # direnv
# eval "$(direnv hook zsh)"

# ghq
export GHQ_ROOT="$HOME"/git


# # PHP 8 requires the latter bison, but we have still error...
# export PATH="/usr/local/opt/bison/bin:$PATH"

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

# }}}

# development {{{

# cpp
export CXX="clang++"
export CXXFLAGS="-std=c++14 -Wall -Wextra -O2"
# export LDFLAGS

# golang
# use GOPATH set
export PATH="$PATH":"$(go env GOPATH)"/bin

# llvm
export PATH=/usr/local/opt/llvm/bin:"$PATH"

# }}}

# history 2 {{{

bindkey '^N' autosuggest-accept

# }}}
