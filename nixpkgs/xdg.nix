{ config, ... }:
let
  homePath = builtins.toString ../..;
in
{
  xdg.configFile = {
    "alacritty/alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/alacritty.yml";
    "sheldon/plugins.toml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/sheldon/plugins.toml";
    "yamllint/config".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/yamllint/config";
    "mypy/config".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/mypy/config";
  };
}
