{ ... }:
let
  home = builtins.getEnv "HOME";
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      view = "nvim -R";
      vimdiff = "nvim -d";
      cat = "bat";
    };

    # history = {
    #   size = 10000;
    #   path = "${config.xdg.dataHome}/zsh/history";
    # };

    initExtra = ''
      . ${home}/.dotfiles/zshrc
    '';
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
