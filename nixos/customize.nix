{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  # users.users.nixos.extraGroups = [ "docker" ];
  home-manager.users.nixos = (import /home/nixos/.dotfiles/nixpkgs/home-manager.nix);
}
