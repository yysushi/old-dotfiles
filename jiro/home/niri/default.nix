{ ... }:

{
  programs.niri = {
    config = builtins.readFile ./config.kdl;
    # settings = {
    #   spawn-at-startup = [
    #     "swaybg -i ~/Downloads/nix-wallpaper-simple-blue.png -m fill"
    #   ];
    # };
  };
  programs.waybar = {
    enable = true;
    package = null;
  };
}
