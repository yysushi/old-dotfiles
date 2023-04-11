{ pkgs, ... }:
{
  imports = [
    <home-manager/nix-darwin>
  ];

  environment = {
    darwinConfig = /Users/y-tsuji/.config/nixpkgs/darwin/configuration.nix;
    systemPackages = [
      pkgs.alacritty
      pkgs.zsh
    ];
    shells = [ pkgs.zsh ];
  };
  services.nix-daemon.enable = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
    userKeyMapping = [
      # https://developer.apple.com/library/archive/technotes/tn2450/_index.html
      {
        # Keyboard Delete Forward 0x70000004C
        HIDKeyboardModifierMappingSrc = 30064771148;
        # Keyboard Right Shift 0x7000000E5
        HIDKeyboardModifierMappingDst = 30064771301;
      }
    ];
  };

  nix = {
    settings.auto-optimise-store = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users.users."y-tsuji" = {
    name = "y-tsuji";
    home = "/Users/y-tsuji";
  };
  home-manager.users."y-tsuji" = (import /Users/y-tsuji/.dotfiles/nixpkgs/home-manager.nix);
}
