{ pkgs, ... }:
let
  extraPackages =
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
    cargo
    ccls
    csvkit
    cue
    cuelsp
    cmake
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
    go
    go-jsonnet
    (google-cloud-sdk.withExtraComponents (with google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]))
    grpcurl
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
    terraform
    terraform-ls
    terraformer
    tflint
    tree
    websocat
    yarn
    yubikey-manager
    yq-go
  ] ++ extraPackages;
}
