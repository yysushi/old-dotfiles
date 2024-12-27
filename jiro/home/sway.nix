{ ... }:
{
  programs = {
    foot = {
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
  };
}
