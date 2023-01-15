{ pkgs, config, lib, ... }:
let
  homePath = builtins.toString ../..;
in
{
  imports = [
    ./others.nix
  ];

  home = {
    stateVersion = "22.11";
    homeDirectory = homePath;
    sessionPath = [
      # homebrew
      "/opt/homebrew/bin"
      # npm
      "${homePath}/.dotfiles/packages/npm/node_modules/.bin"
      # pipx
      "${homePath}/.local/bin"
      # cargo
      "${homePath}/.cargo/bin"
      # go
      "${pkgs.go}/bin"
    ];
    sessionVariables = lib.mkMerge [{
      # editor
      EDITOR = "vim";
      # pager
      PAGER = "more -R";
      # ghq
      GHQ_ROOT = "${homePath}/git";
      # locale
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      # python
      PIPENV_IGNORE_VIRTUALENVS = 1;
      VIRTUAL_ENV_DISABLE_PROMPT = 1;
      # vagrant
      VAGRANT_DEFAULT_PROVIDER = "virtualbox";
      VAGRANT_EXPERIMENTAL = "cloud_init,disks";
      # docker
      DOCKER_BUILDKIT = 1;
      COMPOSE_DOCKER_CLI_BUILD = 1;
      DOCKER_SCAN_SUGGEST = "false";
      # clang
      CXX = "clang++";
      CXXFLAGS = "-std=c++14 -Wall -Wextra -O2";
    }
      (if pkgs.stdenv.isLinux then {
        DISPLAY = "${lib.lists.last config.networking.nameservers}:0";
      } else {
        DOCKER_HOST = "unix://${homePath}/.lima/default/sock/docker.sock";
      })];
    file = {
      ".bashrc".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/bashrc";
      ".screenrc".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/screenrc";
      ".gitignore".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/gitignore";
      ".tslint.json".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/tslint.json";
      ".eslintrc.json".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/eslintrc.json";
      ".dprint.json".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/dprint.json";
      ".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/vimrc";
      ".shellcheckrc".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/shellcheckrc";
      ".clippy.toml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/clippy.toml";
      ".flake8".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/flake8";
      ".protolint.yaml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/protolint.yaml";
      ".inputrc".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/inputrc";
      ".tigrc".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/tigrc";
      ".config/cargo-atcoder.toml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/cargo-atcoder.toml";
      ".config/pet/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/pet/config.toml";
      ".config/pet/snippet.toml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/pet/snippet.toml";
      ".lima/default/lima.yaml".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/lima.yaml";
      ".npm-global/bin".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/packages/npm/node_modules/.bin";
    };
  };
}
