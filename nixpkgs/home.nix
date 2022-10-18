{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "y-tsuji";
  home.homeDirectory = "/Users/y-tsuji";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    act
    age
    bazel
    bitwarden-cli
    cue
    cmake
    direnv
    fd
    fzf
    gauge
    gh
    ghq
    git
    go
    google-cloud-sdk
    grpcurl
    jdk
    jq
    kind
    kubectl
    kubectx
    kustomize
    kotlin
    lua
    nixpkgs-fmt
    neovim
    nodejs
    opa
    protobuf
    (
      let
        my-python-packages = python-packages: with python-packages; [
          pipx
          pynvim
        ];
        python-with-my-packages = python3.withPackages my-python-packages;
      in
      python-with-my-packages
    )
    ripgrep
    ruby
    rustc
    shellcheck
    skaffold
    sqlite
    terraform
    terraform-ls
    terraformer
    tflint
    tig
    tmux
    websocat
    yarn
    yq-go
  ];
}
