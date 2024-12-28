{ ... }:

{
  programs.niri = {
    configs = ./config.kdl;
    # settings = {
    #   spawn-at-startup = [
    #     "swaybg -i ~/Downloads/nix-wallpaper-simple-blue.png -m fill"
    #   ];
    # };
  };
}
