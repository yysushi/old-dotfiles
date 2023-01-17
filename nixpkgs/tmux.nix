{ pkgs, config, ... }:
let
  logPath = "${config.xdg.dataHome}/tmux/log";
in
{
  programs.tmux = {
    enable = true;
    shortcut = "g";
    aggressiveResize = true;
    escapeTime = 0;
    secureSocket = true;
    keyMode = "vi";
    newSession = true;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.copycat
      tmuxPlugins.resurrect
      tmuxPlugins.logging
      tmuxPlugins.yank
      tmuxPlugins.pain-control
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.open
    ];

    extraConfig = ''
      set-option -g mouse on
      set-option -g @logging-path ${logPath}
      set-option -g @screen-capture-path ${logPath}
      set-option -g @save-complete-history-path ${logPath}

      # migrate to tpm entry when supported
      run-shell ${config.xdg.dataHome}/sheldon/repos/github.com/brennanfee/tmux-paste/paste.tmux
    '';
  };
}
