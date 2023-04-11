{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    global = {
      autoUpdate = true;
      brewfile = true;
    };
    brews = [
      "openssl@1.1"
      "socket_vmnet"
    ];
  };
}
