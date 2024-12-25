{ username, ... }:
{
  imports = [
    ./firefox.nix
    ./wezterm.nix
    # ./sway.nix
  ];

  # todo
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";
  # install and manage itself.
  programs.home-manager.enable = true;
}
