{ pkgs, config, ... }:
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

    sessionVariables = {
      # general
      EDITOR = "vim";

      # ghq
      GHQ_ROOT = "${homePath}/git";

      # docker
      DOCKER_BUILDKIT = 1;
      COMPOSE_DOCKER_CLI_BUILD = 1;
      DOCKER_SCAN_SUGGEST = "false";

      # locae
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";

      # atcoder
      CARGO_ATCODER_TEST_CONFIG_DIR = "${homePath}/.config";

      # python
      PIPENV_IGNORE_VIRTUALENVS = 1;
      VIRTUAL_ENV_DISABLE_PROMPT = 1;

      # vagrant
      VAGRANT_DEFAULT_PROVIDER = "virtualbox";
      VAGRANT_EXPERIMENTAL = "cloud_init,disks";

      # clang
      CXX = "clang++";
      CXXFLAGS = "-std=c++14 -Wall -Wextra -O2";
    };

    file = {
      ".bashrc".source = "${homePath}/.dotfiles/bashrc";
      ".screenrc".source = "${homePath}/.dotfiles/screenrc";
      ".gitignore".source = "${homePath}/.dotfiles/gitignore";
      ".tslint.json".source = "${homePath}/.dotfiles/tslint.json";
      ".eslintrc.json".source = "${homePath}/.dotfiles/eslintrc.json";
      ".dprint.json".source = "${homePath}/.dotfiles/dprint.json";
      ".vimrc".source = "${homePath}/.dotfiles/vimrc";
      ".shellcheckrc".source = "${homePath}/.dotfiles/shellcheckrc";
      ".clippy.toml".source = "${homePath}/.dotfiles/clippy.toml";
      ".flake8".source = "${homePath}/.dotfiles/flake8";
      ".protolint.yaml".source = "${homePath}/.dotfiles/protolint.yaml";
      ".inputrc".source = "${homePath}/.dotfiles/inputrc";
      ".tigrc".source = "${homePath}/.dotfiles/tigrc";
      ".config/cargo-atcoder.toml".source = "${homePath}/.dotfiles/cargo-atcoder.toml";
      ".config/pet/config.toml".source = "${homePath}/.dotfiles/pet/config.toml";
      ".config/pet/snippet.toml".source = "${homePath}/.dotfiles/pet/snippet.toml";
      ".lima/docker/lima.yaml".source = "${homePath}/.dotfiles/lima.yaml";
      ".npm-global/bin".source = config.lib.file.mkOutOfStoreSymlink "${homePath}/.dotfiles/packages/npm/node_modules/.bin";
    };
  };
}
