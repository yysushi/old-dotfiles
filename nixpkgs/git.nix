{ pkgs, ... }:
let
  homePath = builtins.toString ../..;
in
{
  home.packages = with pkgs; [
    ghq
    gitAndTools.gh
    gitAndTools.tig
  ];

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "yysushi";
    userEmail = "yoshihiro.tsuji2@gmail";
    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
      core = {
        editor = "nvim";
        excludesFile = "${homePath}/.gitignore";
        hooksPath = ".husky";
        pager = "bat";
      };
      diff.tool = "vimdiff";
      merge.tool = "vimdiff";
      pull.ff = "only";
      mergetool.keepBackup = false;
    };
  };
}
