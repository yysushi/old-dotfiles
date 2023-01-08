{ lib, ... }:
{
  options = {
    settings = {
      username = lib.mkOption {
        default = "y-tsuji";
      };
      gitUsername = lib.mkOption {
        default = "yysushi";
      };
      email = lib.mkOption {
        default = "yoshihiro.tsuji2@gmail.com";
      };
    };
  };
}
