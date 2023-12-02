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
    age
    bash
    bazel
    bitwarden-cli
    buf-language-server
    cargo
    colima
    cue
    cuelsp
    cmake
    dart
    deno
    dprint
    etcd
    fd
    fzf
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
    jq
    jsonnet-bundler
    jsonnet-language-server
    kind
    kubectl
    kubectx
    kustomize
    lua
    ngrep
    nil
    nixpkgs-fmt
    nodejs
    openssh
    openssl
    pass
    parallel
    pstree
    protobuf
    protoc-gen-connect-go
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-validate
    ripgrep
    rustc
    sd
    sequoia
    screen
    sheldon
    shellcheck
    skaffold
    sqlite
    sqlfluff
    tailscale
    tcpdump
    temporal-cli
    temporalite
    terraform
    terraform-ls
    terraformer
    tflint
    tree
    websocat
    wireshark
    yarn
    yubikey-manager
    yq-go
  ] ++ (with pkgsUnstable;[
    buf
    sqlc
  ]) ++ extraPackages1;
}
