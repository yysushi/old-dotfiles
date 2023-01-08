{ ... }:
let
  homePath = builtins.toString ../..;
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
      . ${homePath}/.dotfiles/zshrc
    '';
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
