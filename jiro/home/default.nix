{ username, niri-flake, ... }:
{
  imports = [
    ./firefox.nix
    ./wezterm.nix
    ./sway.nix
    ./niri.nix

    niri-flake.homeModules.niri
  ];

  # todo
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";
  # install and manage itself.
  programs.home-manager.enable = true;
}
