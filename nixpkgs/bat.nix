{ ... }:
let
  homePath = builtins.toString ../..;
in
{
  programs.bat = {
    enable = true;
    config.theme = "base16";
  };
}
