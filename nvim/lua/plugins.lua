local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  {
    -- colorscheme
    'nordtheme/vim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_uniform_diff_background = 1
      vim.cmd([[colorscheme nord]])
    end,
  },
  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    },
    config = function()
      require("config.telescope")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "RRethy/nvim-treesitter-endwise", name = "nvim-ts-endwise" },
    },
    event = "BufReadPost",
    config = function()
      require("config.treesitter")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    config = function()
      require("config.comment")
    end,
  },
},{
  lazy = true,
})
