local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dart",
    "go",
    "gomod",
    "html",
    "java",
    "javascript",
    "jsonnet",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "python",
    "rust",
    "scss",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = false,
  },
  indent = {
    enable = false,
  },
})
