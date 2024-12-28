{ username, ... }:
{
  imports = [
    ./firefox.nix
    ./wezterm.nix
    ./sway.nix
    ./alacritty.nix
    ./kitty.nix
    ./niri
  ];

  # todo
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";
  # install and manage itself.
  programs.home-manager.enable = true;
}
