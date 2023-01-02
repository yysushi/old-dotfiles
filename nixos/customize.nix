{ pkgs, config, lib, home-path, username, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  home-nix-path = "${home-path}/.dotfiles/nixpkgs/home.nix";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.defaultUserShell = pkgs.zsh;
  users.users.nixos.extraGroups = [ "docker" ];

  environment.variables = {
    HOME = home-path;
    USERNAME = username;
  };


  home-manager.users.nixos = (import home-nix-path {
    pkgs = pkgs;
    config = config;
    lib = lib;
  });
}
