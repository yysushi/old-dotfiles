{ xremap-flake, ... }:

{
  imports = [
    xremap-flake.nixosModules.default
  ];
  services.xremap = {
    config = {
      modmap = [
        {
          name = "Global";
          # remap = { "CapsLock" = "Control"; };
          remap = { "CapsLock" = "Control_L"; };
        }
      ];
    };
  };
}

