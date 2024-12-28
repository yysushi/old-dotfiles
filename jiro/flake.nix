{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake.url = "github:sodiboo/niri-flake";
    stylix-flake.url = "github:danth/stylix";

    wezterm-flake.url = "github:wez/wezterm?dir=nix";
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, nur, niri-flake, stylix-flake, wezterm-flake, xremap-flake, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.jiro = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/jiro/configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-x1-11th-gen
        niri-flake.nixosModules.niri
        stylix-flake.nixosModules.stylix

        (import ./xremap.nix inputs)

        nur.modules.nixos.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = inputs // { username = "yysushi"; };
            users.yysushi = import ./home;
            sharedModules = [
              nur.modules.homeManager.default
              # stylix-flake.homeManagerModules.stylix
            ];
          };
        }
      ];
    };
  };
}
