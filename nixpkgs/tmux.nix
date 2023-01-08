{ pkgs, ... }:
let
  home = builtins.getEnv "HOME";
in
{
  programs.tmux = {
    enable = true;
    shortcut = "g";
    aggressiveResize = true;
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.copycat
      tmuxPlugins.resurrect
      tmuxPlugins.logging
      tmuxPlugins.yank
      tmuxPlugins.pain-control
    ];

    extraConfig = ''
      set-option -g mouse on
      set-option -g status-keys vi
      set-window-option -g mode-keys vi
      TMUX_LOGGING_PATH="${home}/tmux/log"
      set-option -g @logging-path $TMUX_LOGGING_PATH
      set-option -g @screen-capture-path $TMUX_LOGGING_PATH
      set-option -g @save-complete-history-path $TMUX_LOGGING_PATH
    '';
  };
}
