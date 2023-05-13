local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dart",
    "go",
    "html",
    "java",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "python",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = false,
  },
  indent = {
    enable = true,
  },
  -- -- For nvim-ts-context-commentstring plugin.
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },

  -- -- For nvim-treesitter-endwise plugin.
  -- endwise = {
  --   enable = true,
  -- },
})
