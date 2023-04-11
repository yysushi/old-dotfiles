{ config, ... }:
let
  homePath = builtins.toString ../..;
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      cat = "bat";
    };
    autocd = true;
    sessionVariables = {
      SHELDON_CONFIG_FILE = "${config.xdg.configHome}/sheldon/plugins.toml";
      SHELDON_DATA_DIR = "${config.xdg.dataHome}/sheldon";
    };
    profileExtra = ''
      DISPLAY="$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0"
      bindkey -v
      setopt no_beep
      # TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
      # command -v limactl > /dev/null && TESTCONTAINERS_HOST_OVERRIDE=$(limactl shell default ip a show lima0 | grep 'inet '| awk '{print $2}' | cut -f1 -d"/")
    '';
    initExtra = ''
      eval "$(sheldon source)"

      bindkey '^N' autosuggest-accept
      . "${homePath}/.dotfiles/agkozak_prompt.zsh"
    '';
  };
  programs.zoxide.enable = true;
}
