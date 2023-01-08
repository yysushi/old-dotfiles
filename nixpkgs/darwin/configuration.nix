{ config, pkgs, ... }:
let
  home = builtins.getEnv "HOME";
  username = config.settings.username;
in
{
  imports = [
    <home-manager/nix-darwin>
    "${home}/.config/nixpkgs/options.nix"
  ];

  environment = {
    darwinConfig = "${home}/.config/nixpkgs/darwin/configuration.nix";
    shells = [ pkgs.zsh ];
  };
  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users."${username}" = {
    name = username;
    home = home;
  };
  home-manager.users."${username}" = (import "${home}/.dotfiles/nixpkgs/home-manager.nix");
}
