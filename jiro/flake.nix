{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, nixos-hardware, xremap-flake, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.jiro = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix

        nixos-hardware.nixosModules.lenovo-thinkpad-x1-11th-gen

        xremap-flake.nixosModules.default
        ./xremap.nix

        ./chromium.nix
        ./fprintd.nix
      ];
    };
  };
}
