{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    shellAliases = {
      cat = "bat";
    };
    autocd = true;
    profileExtra = ''
      DISPLAY="$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0"
      setopt no_beep
      # TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
      # command -v limactl > /dev/null && TESTCONTAINERS_HOST_OVERRIDE=$(limactl shell default ip a show lima0 | grep 'inet '| awk '{print $2}' | cut -f1 -d"/")
    '';
    initExtra = ''
      bindkey -v
      bindkey '^N' autosuggest-accept

      eval "$(sheldon source)"

      . "${config.home.homeDirectory}/.dotfiles/agkozak_prompt.zsh"
    '';
  };
}
