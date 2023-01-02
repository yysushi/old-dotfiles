{ pkgs, config, modulesPath, lib, ... }:

let
  nixos-wsl = import /etc/nixos/nixos-wsl;
  home-path = "/home/nixos";
  username = "nixos";
in
{
  imports = [
    nixos-wsl.nixosModules.wsl

    (import "${home-path}/.dotfiles/nixos/customize.nix" {
      pkgs = pkgs;
      config = config;
      lib = lib;
      home-path = home-path;
      username = username;
    })
  ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = username;
    startMenuLaunchers = true;

    # Enable native Docker support
    docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "22.11";
}
