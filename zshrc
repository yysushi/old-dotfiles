# vim: set foldmethod=marker foldlevel=0 nomodeline:

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim
bindkey -v
alias vim='nvim'
alias view='nvim -R'

# no beep
setopt no_beep

# zinit {{{
#
# after updating, measure load time by "time ( zsh -i -c exit )"

autoload -U compinit; compinit
autoload -U colors; colors
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps}  )) && _comps[zinit]=_zinit

# history {{{

zinit light zsh-users/zsh-autosuggestions

# }}}

# completion {{{
#
# output $fpath and find compdef file by "find $fpath -name _pass"
# please note compdef is overwritten by afterward fpath's definition

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
AGKOZAK_CUSTOM_PROMPT+='%F{cyan}koketani%1v:%f '
# path
AGKOZAK_CUSTOM_PROMPT+='$(_fishy_collapsed_wd)'
# git status
AGKOZAK_CUSTOM_PROMPT+=$'%(6V. (%16>>%6v%>>%(7V. %7v.)).)'
# prompt character
AGKOZAK_CUSTOM_PROMPT+='\$ '
# no right prompt
AGKOZAK_CUSTOM_RPROMPT=''
# Array containing custom Git symbols for the statuses
# Diverged, Behind, Ahead, New file(s), Deleted, Modified, Renamed, Untracked, Stashed changes
AGKOZAK_CUSTOM_SYMBOLS=( '&*' '&' '*' '+' 'x' '!' '>' '?' '$' )

# }}}

# }}}

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
