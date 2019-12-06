#!/bin/bash

here=$(cd $(dirname $0); pwd -P)

# under $HOME
ln -Ffs $here/tmux.conf $HOME/.tmux.conf
ln -Ffs $here/bash_profile $HOME/.bash_profile
ln -Ffs $here/bashrc $HOME/.bashrc
ln -Ffs $here/screenrc $HOME/.screenrc
ln -Ffs $here/gitconfig $HOME/.gitconfig
ln -Ffs $here/gitignore $HOME/.gitignore
ln -Ffs $here/agignore $HOME/.agignore
ln -Ffs $here/tslint.json $HOME/.tslint.json
ln -Ffs $here/eslintrc.json $HOME/.eslintrc.json

# under $HOME/.config
## nvim
mkdir -p $HOME/.config/nvim
ln -Ffs $here/init.vim $HOME/.config/nvim/init.vim
