#!/bin/zsh -e

here=$(cd "$(dirname "$0")" && pwd -P)
platform=$(uname -s)

# under "$HOME"
ln -Ffs "$here"/tmux.conf "$HOME"/.tmux.conf
ln -Ffs "$here"/bashrc "$HOME"/.bashrc
ln -Ffs "$here"/zshrc "$HOME"/.zshrc
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

mkdir -p "$HOME"/.config
# under "$HOME"/.config
ln -Ffs "$here"/cargo-atcoder.toml "$HOME"/.config/cargo-atcoder.toml
# under "$HOME"/.config/pet
[[ -d "$HOME"/.config/pet ]] || ln -Ffs "$here"/pet "$HOME"/.config/pet
# under "$HOME"/.config/nvim
[[ -d "$HOME"/.config/nvim ]] || ln -Ffs "$here"/nvim "$HOME"/.config/nvim
# under "$HOME"/.config/yamllint
[[ -d "$HOME"/.config/yamllint/config ]] || mkdir -p "$HOME"/.config/yamllint && ln -Ffs "$here"/yamllint "$HOME"/.config/yamllint/config

# under "$HOME"/Developments
mkdir -p "$HOME"/Developments

# under "$HOME/.npm-global"
mkdir -p "$HOME"/.npm-global
ln -Ffs "$here"/packages/npm/node_modules/.bin "$HOME"/.npm-global/bin

# echo for others
echo install packages
