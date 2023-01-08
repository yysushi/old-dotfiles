{ lib, ... }:
let
  home = builtins.getEnv "HOME";
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = lib.fileContents "${home}/.dotfiles/nvim/init.vim";
  };
}
