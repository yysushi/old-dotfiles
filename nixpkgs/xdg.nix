{ config, ... }:
{
  xdg = {
    enable = true;
    configFile = {
      "alacritty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/alacritty";
      "sheldon/plugins.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sheldon/plugins.toml";
      "yamllint/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/yamllint/config";
      "mypy/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/mypy/config";
    };
  };
}
