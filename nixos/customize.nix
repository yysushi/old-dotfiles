{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  home = builtins.getEnv "HOME";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.defaultUserShell = pkgs.zsh;
  users.users.nixos.extraGroups = [ "docker" ];

  home-manager.users.nixos = (import "${home}/.dotfiles/nixpkgs/home-manager.nix");
}
