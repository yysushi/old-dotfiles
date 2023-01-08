{ lib, home-path, ... }:
{
  programs.neovim = {
    enable = true;
    # plugins = with pkgs; [
    #   vimPlugins.vim-plug
    # ];
    viAlias = true;
    vimAlias = true;
    extraConfig = lib.fileContents "${home-path}/.dotfiles/nvim/init.vim";
  };
}
