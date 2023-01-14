{ pkgs, config, ... }:
let
  logPath = "${config.xdg.dataHome}/tmux/log";
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
      set-option -g @logging-path ${logPath}
      set-option -g @screen-capture-path ${logPath}
      set-option -g @save-complete-history-path ${logPath}
    '';
  };
}
