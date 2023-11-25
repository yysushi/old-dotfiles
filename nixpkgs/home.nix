{ pkgs, config, lib, ... }:
let
  homePath = builtins.toString ../..;
in
{
  imports = [
    ./others.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "terraform"
  ];


  home = {
    stateVersion = "23.05";
    homeDirectory = homePath;
    sessionPath = [
      # npm
      "${config.home.homeDirectory}/.dotfiles/packages/npm/node_modules/.bin"
      # pipx
      "${config.home.homeDirectory}/.local/bin"
      # cargo
      "${config.home.homeDirectory}/.cargo/bin"
      # go
      "${config.home.homeDirectory}/go/bin"
    ];
    sessionVariables = lib.mkMerge [{
      # editor
      EDITOR = "vim";
      # pager
      PAGER = "more -R";
      # ghq
      GHQ_ROOT = "${config.home.homeDirectory}/git";
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
        # NOTE: not work..
        # DISPLAY = "${lib.lists.last config.networking.nameservers}:0";
      } else {
        DOCKER_HOST = "unix://${config.home.homeDirectory}/.lima/default/sock/docker.sock";
      })];
    file = {
      # symlink configurations
      ".bashrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/bashrc";
      ".screenrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/screenrc";
      ".gitignore".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/gitignore";
      ".tslint.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/tslint.json";
      ".eslintrc.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/eslintrc.json";
      ".dprint.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/dprint.json";
      ".shellcheckrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/shellcheckrc";
      ".clippy.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/clippy.toml";
      ".flake8".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/flake8";
      ".protolint.yaml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/protolint.yaml";
      ".inputrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/inputrc";
      ".tigrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/tigrc";
      ".config/cargo-atcoder.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/cargo-atcoder.toml";
      ".config/pet/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/pet/config.toml";
      ".config/pet/snippet.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/pet/snippet.toml";
      ".lima/default/lima.yaml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/lima.yaml";
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
      # fetch configs/scripts remotely
      "${config.xdg.dataHome}/repos/github.com/alacritty/alacritty-theme".source = pkgs.fetchFromGitHub {
        owner = "alacritty";
        repo = "alacritty-theme";
        rev = "e4464d5ed853d510db5d93b5199d4569d34669d8";
        hash = "sha256-C0q4eBtxpER2ellG0Os/BTL3MDaq4rao3Yh+ytnR1X4=";
      };
      "${config.xdg.dataHome}/repos/github.com/brennanfee/tmux-paste".source = pkgs.fetchFromGitHub {
        owner = "brennanfee";
        repo = "tmux-paste";
        rev = "v2.0.0";
        hash = "sha256-rNoUOyoBJsRxKRB4XDfa3vtAkDACy2mXYMy4whtbn88=";
      };
      # symlink bin directories
      ".npm-global/bin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/packages/npm/node_modules/.bin";
    };
  };
}
