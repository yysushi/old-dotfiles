{ pkgs, config, modulesPath, lib, ... }:

let
  nixos-wsl = import /etc/nixos/nixos-wsl;
in
{
  imports = [
    nixos-wsl.nixosModules.wsl
    /home/nixos/.dotfiles/nixos/customize.nix
  ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;

    docker-native.enable = false;
    # docker-desktop.enable = true;
  };

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "22.11";
}
