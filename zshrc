# vim: set foldmethod=marker foldlevel=0 nomodeline:

# nixos-wsl {{{

# display
[[ -v WSLENV ]] \
&& LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}') \
&& export DISPLAY=$LOCAL_IP:0

# }}}

# darwin {{{

[[ ! -v WSLENV ]] \
&& export PATH="$PATH":/opt/homebrew/bin \
&& export DOCKER_HOST=unix://"$HOME"/.lima/default/sock/docker.sock

# }}}

# prompt {{{

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
# exit status
AGKOZAK_CUSTOM_PROMPT='%(?..%B%F{red}(%?%)%f%b )'
# username
AGKOZAK_CUSTOM_PROMPT+='%F{cyan}${USERNAME}%1v:%f '
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

# skip using tmux-256color in mac osx since the package ncurse is too old..
# ref: https://github.com/tmux/tmux/issues/2262
# export TERM=screen-256color

# local path
export PATH="$PATH":/usr/local/bin

# local tools installed by npm
export PATH="$PATH":"$HOME"/.dotfiles/packages/npm/node_modules/.bin

# editor
bindkey -v

# no beep
setopt no_beep

# auto cd
setopt auto_cd

# }}}

# history 1 {{{

# }}}

# tools {{{

# # PHP 8 requires the latter bison, but we have still error...
# export PATH="/usr/local/opt/bison/bin:$PATH"

# pipx
export PATH="$PATH":"$HOME"/.local/bin

# rancher desktop
export PATH="$PATH":"$HOME"/.rd/bin

# }}}

# development {{{

# golang
# use GOPATH set
export PATH="$PATH":"$(go env GOPATH)"/bin

# llvm
export PATH=/usr/local/opt/llvm/bin:"$PATH"

# }}}

# history 2 {{{

bindkey '^N' autosuggest-accept

# }}}

# sheldon {{{

# PURE_PROMPT_SYMBOL="^"
# # prompt pure
# prompt_newline='%666v'
# # PROMPT=" $PROMPT"

export PATH="$PATH":/usr/local/bin
eval "$(sheldon source)"

# }}}
