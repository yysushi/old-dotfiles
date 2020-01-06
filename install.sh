#!/bin/bash

here=$(cd $(dirname $0); pwd -P)
platform=$(uname -s)

# under $HOME
ln -Ffs $here/tmux.conf $HOME/.tmux.conf
## For Linux, load the default profile
[ $platform = "Darwin" ] && ln -Ffs $here/bash_profile $HOME/.bash_profile
ln -Ffs $here/bashrc $HOME/.bashrc
ln -Ffs $here/screenrc $HOME/.screenrc
ln -Ffs $here/gitconfig $HOME/.gitconfig
ln -Ffs $here/gitignore $HOME/.gitignore
ln -Ffs $here/agignore $HOME/.agignore
ln -Ffs $here/tslint.json $HOME/.tslint.json
ln -Ffs $here/eslintrc.json $HOME/.eslintrc.json
ln -Ffs $here/vimrc $HOME/.vimrc
## # under $HOME/.vim
## mkdir -p $HOME/.vim
## ln -Ffs $here/vim_config $HOME/.vim/_config

# under $HOME/.config/pet
mkdir -p $HOME/.config/pet
ln -Ffs $here/pet_config.toml $HOME/.config/pet/config.toml
