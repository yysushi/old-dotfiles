{ lib, pkgs, ... }:
let
  pkgsUnstable = import <nixpkgs-unstable> { };
  extraPackages =
    if pkgs.stdenv.isLinux then with pkgsUnstable;[
      # nixos-wsl
      sheldon
      x11docker
    ] else with pkgsUnstable;[
      # darwin
      gnugrep
      gnused
    ];
in
{
  home.packages = with pkgsUnstable;[
    act
    age
    alacritty
    auth0-cli
    bat
    bash
    bazel
    bitwarden-cli
    cargo
    ccls
    cue
    cmake
    dasel
    deno
    dprint
    fd
    fzf
    gauge
    gcc
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
    plantuml
    pstree
    protobuf
    (python310.withPackages (python-packages: with python-packages; [
      pipx
      pynvim
      python-lsp-server
    ]))
    ripgrep
    ruby
    rustc
    sequoia
    screen
    shellcheck
    skaffold
    sqlite
    tcpdump
    terraform
    terraform-ls
    terraformer
    tflint
    tree
    websocat
    wireshark
    yarn
    yq-go
  ] ++ extraPackages;
}
