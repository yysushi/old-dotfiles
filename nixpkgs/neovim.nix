{ lib, ... }:
let
  homePath = builtins.toString ../..;
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = lib.fileContents "${homePath}/.dotfiles/nvim/init.vim";
  };
}
