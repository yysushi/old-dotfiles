#!/bin/bash

here=$(cd $(dirname $0); pwd -P)

# under $HOME
ln -Ffs $here/tmux.conf $HOME/.tmux.conf
ln -Ffs $here/bashrc $HOME/.bashrc
ln -Ffs $here/mybashrc $HOME/.mybashrc
ln -Ffs $here/screenrc $HOME/.screenrc
ln -Ffs $here/gitconfig $HOME/.gitconfig
ln -Ffs $here/gitignore $HOME/.gitignore
ln -Ffs $here/agignore $HOME/.agignore
ln -Ffs $here/gitmessage.txt $HOME/.gitmessage.txt

# under $HOME/.config
## nvim
mkdir -p $HOME/.config/nvim
ln -Ffs $here/init.vim $HOME/.config/nvim/init.vim
