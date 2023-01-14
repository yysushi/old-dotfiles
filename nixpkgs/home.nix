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

      # sheldon
      SHELDON_CONFIG_FILE = "${config.xdg.configHome}/sheldon/plugins.toml";
    };

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
