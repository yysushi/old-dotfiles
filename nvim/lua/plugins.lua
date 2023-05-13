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
  -- colorscheme
  {
    -- https://github.com/folke/lazy.nvim/tree/main#-colorschemes
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme base16-ocean]])
    end,
  },
  -- ff
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    -- cmd = 'Telescope',
    keys = { "<Space>" },
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
