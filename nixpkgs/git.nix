{ pkgs, config, ... }:
let
  homePath = builtins.getEnv "HOME";
in
{
  imports = [
    ./options.nix
  ];

  home.packages = with pkgs; [
    ghq
    gitAndTools.gh
    gitAndTools.tig
  ];

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = config.settings.gitUsername;
    userEmail = config.settings.email;
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
