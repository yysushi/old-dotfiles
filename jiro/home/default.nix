{ pkgs, username, ... }:
{
  imports = [
    ./firefox.nix
    ./wezterm.nix
    ./sway.nix
    ./alacritty.nix
    ./kitty.nix
    ./niri
  ];

  programs.ripgrep.enable = true;
  programs.fd.enable = true;

  # todo
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";
  # install and manage itself.
  programs.home-manager.enable = true;

  home.file.".profile".source = pkgs.writeText "profile" ''
    [ "$(tty)" = "/dev/tty1" ] && exec niri
    # if [[ -z $WAYLAND_DISPLAY ]]; then
    #   XDG_RUNTIME_DIR=/run/user/$(id -u) exec niri
    # fi
  '';
}
