{ config, ... }:
let
  homePath = builtins.toString ../..;
in
{
  xdg.configFile = {
    "alacritty".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/alacritty";
    "sheldon/plugins.toml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/sheldon/plugins.toml";
    "yamllint/config".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/yamllint/config";
    "mypy/config".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/mypy/config";
  };
}
