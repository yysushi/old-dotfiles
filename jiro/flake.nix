{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm-flake.url = "github:wez/wezterm?dir=nix";
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, wezterm-flake, xremap-flake, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.jiro = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/jiro/configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-x1-11th-gen

        (import ./xremap.nix inputs)
        ./chromium.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = inputs // { username = "yysushi"; };
          home-manager.users.yysushi = import ./home;
        }
      ];
    };
  };
}
