{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "g";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    aggressiveResize = true;
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.copycat
      tmuxPlugins.resurrect
      tmuxPlugins.logging
      tmuxPlugins.yank
      tmuxPlugins.pain-control
    ];
    #   tmuxPlugins.better-mouse-mode
    # ];

    extraConfig = ''
      set-option -g mouse on
      set-option -g status-keys vi
      set-window-option -g mode-keys vi
      TMUX_LOGGING_PATH="~/.tmux/log"
      set-option -g @logging-path $TMUX_LOGGING_PATH
      set-option -g @screen-capture-path $TMUX_LOGGING_PATH
      set-option -g @save-complete-history-path $TMUX_LOGGING_PATH
    '';
  };
}
