{ pkgs, wezterm-flake, ... }:

{
  programs = {
    wezterm = {
      enable = true;
      package = wezterm-flake.packages.${pkgs.system}.default;
    };
  };
}
