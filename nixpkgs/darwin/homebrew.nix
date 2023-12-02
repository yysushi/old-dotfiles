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
    taps = [
      # https://github.com/grishka/NearDrop
      "grishka/grishka"
    ];
    brews = [
      # "grishka/grishka/neardrop"

      "openssl@3"
    ];
  };
}
