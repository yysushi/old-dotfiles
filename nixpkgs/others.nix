{ pkgs, ... }:
let
  pkgsUnstable = import <nixpkgs-unstable> { };
  extraPackages1 =
    if pkgs.stdenv.isLinux then with pkgs;[
      # nixos-wsl
      (python310.withPackages (python-packages: with python-packages; [
        pipx
        pynvim
        python-lsp-server
      ]))
      sheldon
      usbutils
      # x11docker
      linuxKernel.packages.linux_5_15.usbip
    ] else with pkgs;[
      # darwin
      # what's diff with docker-client?
      docker
      gnugrep
      gnused
      (python311.withPackages (python-packages: with python-packages; [
        pipx
        pynvim
        python-lsp-server
      ]))
    ];
in
{
  home.packages = with pkgs;[
    act
    age
    auth0-cli
    bash
    bazel
    bitwarden-cli
    buf-language-server
    cargo
    ccls
    csvkit
    cue
    cuelsp
    cmake
    dart
    dasel
    deno
    dprint
    expect
    fd
    fzf
    gauge
    gcc
    gitRepo
    gnumake
    gnupg
    go
    go-jsonnet
    gojq
    (google-cloud-sdk.withExtraComponents (with google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
      pubsub-emulator
    ]))
    grpc-gateway
    grpcui
    grpcurl
    hadolint
    htop
    inetutils
    jdk
    jq
    jsonnet-bundler
    jsonnet-language-server
    kind
    kubectl
    kubectx
    kustomize
    kotlin
    lima
    lua
    ngrep
    nil
    nixpkgs-fmt
    nodejs
    openssh
    openssl
    pass
    parallel
    plantuml
    pstree
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    ripgrep
    ruby
    rustc
    sd
    sequoia
    screen
    shellcheck
    skaffold
    sqlite
    sqlint
    tailscale
    tcpdump
    temporal-cli
    temporalite
    terraform
    terraform-ls
    terraformer
    tflint
    tshark
    tree
    websocat
    yarn
    yubikey-manager
    yq-go
  ] ++ (with pkgsUnstable;[
    buf
  ]) ++ extraPackages1;
}
