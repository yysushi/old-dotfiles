{ ... }:
{
  programs = {
    foot = {
      enable = true;
    };
    swaylock = {
      enable = true;
    };
  };
  wayland.windowManager.sway = {
    enable = true;
    # https://github.com/NixOS/nixpkgs/issues/128469
    package = null;
    config = {
      modifier = "Mod4";
      # terminal = "wezterm";
      terminal = "foot";
      startup = [
        # {command = "wezterm";}
        {command = "firefox";}
        {command = "foot";}
      ];
    };
    extraConfig = ''
      # swayfx
      # corner_radius 5
      corner_radius 10
      # decoration {
      #   corner_radius 10
      # }
      gaps inner 10
    '';
  };
}
