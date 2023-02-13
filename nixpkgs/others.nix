{ pkgs, ... }:
let
  extraPackages =
    if pkgs.stdenv.isLinux then with pkgs;[
      # nixos-wsl
      sheldon
      x11docker
      # ] else with pkgsUnstable;[
    ] else with pkgs;[
      # darwin
      # what's diff with docker-client?
      docker
      gnugrep
      gnused
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
    cue
    cuelsp
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
    nil
    nixpkgs-fmt
    nodejs
    opa
    openssl
    pass
    parallel
    plantuml
    pstree
    protobuf
    (python311.withPackages (python-packages: with python-packages; [
      pipx
      pynvim
      python-lsp-server
    ]))
    ripgrep
    ruby
    rustc
    sd
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
    yarn
    yq-go
  ] ++ extraPackages;
}
