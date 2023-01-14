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
