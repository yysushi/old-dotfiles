{ ... }:
let
  homePath = builtins.toString ../..;
in
{
  programs.alacritty = {
    enable = true;
  };
  xdg.configFile."alacritty/alacritty.yml".source = "${homePath}/.dotfiles/alacritty.yml";
}
