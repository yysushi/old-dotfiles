{ ... }:
let
  homePath = builtins.toString ../..;
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
