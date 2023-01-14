{ pkgs, config, lib, ... }:
{
  imports = [
    <home-manager/nix-darwin>
  ];

  environment = {
    darwinConfig = /Users/y-tsuji/.config/nixpkgs/darwin/configuration.nix;
    systemPackages = [
      pkgs.zsh
      pkgs.alacritty
    ];
    shells = [ pkgs.zsh ];
  };
  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users."y-tsuji" = {
    name = "y-tsuji";
    home = "/Users/y-tsuji";
  };
  home-manager.users."y-tsuji" = (import /Users/y-tsuji/.dotfiles/nixpkgs/home-manager.nix);
}
