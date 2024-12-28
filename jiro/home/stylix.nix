{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ./nix-wallpaper-simple-red.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  };
}
