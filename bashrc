# vi mode in bash
set -o vi

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=nvim
export TERM=screen-256color

# alias
alias ll='ls -alh'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'

# tmux
mkdir -p "$HOME"/.tmux/log

# virtualenv configuration
export WORKON_HOME="$HOME"/.virtualenvs
. "$HOME"/.local/bin/virtualenvwrapper.sh

# dev
export DEV_ROOT_PATH=$HOME/git

# golang
source "$HOME"/.gvm/scripts/gvm
gvm use go1.9.1 > /dev/null
export GOPATH="$HOME"/.go
export PATH="$PATH":"$GOPATH"/bin
export PATH="$PATH":/usr/local/go/bin

# ghq
export GHQ_ROOT="$HOME"/.ghq
export GHQ_ROOT="$GHQ_ROOT":"$GOPATH"/src

# trash
#source $HOME/.locale_en_US
## boost configuration
#export BOOST_HOME=~/.boost
#export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/.boost/include:/usr/include/python2.7/pyconfig.h
#
## pyv8 configuration
#export PATH=/usr/local/bin/depot_tools:"$PATH"
#export V8_HOME=$HOME/git/home/v8
# ## tmuxinator
# [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
#
# ## tmuxinator config
# . ~/.bin/tmuxinator.bash
# export DISABLE_AUTO_TITLE=true

# ## bash_completion; Add the following lines to your ~/.bash_profile:
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi

# if which rbenv> /dev/null; then eval "$(rbenv init -)"; fi
#
# ##
#
# # https://github.com/creationix/nvm
# export NVM_DIR="$HOME"/.nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# ## neovim
# export XDG_CONFIG_HOME=~/.config
#
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
# export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
