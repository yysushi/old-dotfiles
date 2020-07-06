#!/bin/zsh -e

here=$(cd "$(dirname "$0")" && pwd -P)
platform=$(uname -s)

# under "$HOME"
ln -Ffs "$here"/tmux.conf "$HOME"/.tmux.conf
ln -Ffs "$here"/bashrc "$HOME"/.bashrc
ln -Ffs "$here"/zshrc "$HOME"/.zshrc
ln -Ffs "$here"/zprofile "$HOME"/.zprofile
ln -Ffs "$here"/screenrc "$HOME"/.screenrc
ln -Ffs "$here"/gitconfig "$HOME"/.gitconfig
ln -Ffs "$here"/gitignore "$HOME"/.gitignore
ln -Ffs "$here"/agignore "$HOME"/.agignore
ln -Ffs "$here"/tslint.json "$HOME"/.tslint.json
ln -Ffs "$here"/eslintrc.json "$HOME"/.eslintrc.json
ln -Ffs "$here"/vimrc "$HOME"/.vimrc
ln -Ffs "$here"/shellcheckrc "$HOME"/.shellcheckrc
ln -Ffs "$here"/tool-versions "$HOME"/.tool-versions
## for darwin
[[ "$platform" == Darwin  ]] && ln -Ffs "$here"/bash_profile "$HOME"/.bash_profile

# under "$HOME"/.tmux
mkdir -p "$HOME"/.tmux/log

# under "$HOME"/.config/pet
mkdir -p "$HOME"/.config
[[ -d "$HOME"/.config/pet ]] || ln -Ffs "$here"/pet "$HOME"/.config/pet

# under "$HOME"/Developments
mkdir -p "$HOME"/Developments

# echo for others
echo install packages
