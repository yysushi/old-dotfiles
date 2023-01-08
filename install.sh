#!/bin/zsh -e

here=$(cd "$(dirname "$0")" && pwd -P)
platform=$(uname -s)

# nix os in wsl
IN_WSL_NIX=0
wslpath -w /etc/nixos >/dev/null 2>&1 && IN_WSL_NIX=1

if [[ $IN_WSL_NIX -eq 1 ]]
then
  sudo ln -Ffs "$here"/nixos/configuration.nix /etc/nixos/configuration.nix
else
  ln -Ffs "$here"/nixpkgs "$HOME"/.config
fi

# echo for others
echo install packages
