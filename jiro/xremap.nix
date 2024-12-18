{ pkgs, ... }:

{
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
