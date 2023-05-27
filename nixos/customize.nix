{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.defaultUserShell = pkgs.zsh;
  # users.users.nixos.extraGroups = [ "docker" ];
  home-manager.users.nixos = (import /home/nixos/.dotfiles/nixpkgs/home-manager.nix);
}
