{ config, pkgs, lib, ... }:

let
  home-path = config.environment.variables.HOME;
  username = config.environment.variables.USERNAME;
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.homeDirectory = home-path;
  home.username = username;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  imports = [
    ./direnv.nix
    ./home-manager.nix
    (import ./neovim.nix {
      lib = lib;
      home-path = home-path;
    })
    ./tmux.nix
  ];


  # programs.zsh = {
  #   enable = true;
  #   #   size = 10000;
  #   #   path = "${config.xdg.dataHome}/zsh/history";
  #   # };
  # };

  home.packages = with pkgs; [
    act
    age
    alacritty
    auth0-cli
    bat
    bash
    bazel
    bitwarden-cli
    cargo
    cue
    cmake
    deno
    fd
    fzf
    gauge
    gh
    ghq
    git
    gnumake
    go
    (google-cloud-sdk.withExtraComponents (with google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]))
    grpcurl
    jdk
    jq
    kind
    kubectl
    kubectx
    kustomize
    kotlin
    lima
    lua
    ngrep
    nixpkgs-fmt
    nodejs
    opa
    openssl
    pass
    protobuf
    (python310.withPackages (python-packages: with python-packages; [
      pipx
      pynvim
      python-lsp-server
    ]))
    ripgrep
    ruby
    rustc
    screen
    sheldon
    shellcheck
    skaffold
    sqlite
    tcpdump
    terraform
    terraform-ls
    terraformer
    tflint
    tig
    tree
    websocat
    wireshark
    xorg.xeyes
    x11docker
    yarn
    yq-go
    zsh
  ];
}
