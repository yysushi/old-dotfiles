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
      run-shell ${config.xdg.dataHome}/repos/github.com/brennanfee/tmux-paste/paste.tmux

      # https://github.com/srid/nixos-config/blob/eb3c7a7354f4f170073c9ff91c949799c9ad4320/home/tmux.nix#L19-L23
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
    '';
  };
}
