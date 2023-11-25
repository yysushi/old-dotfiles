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
    'shaunsingh/nord.nvim',
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
    'iamcco/markdown-preview.nvim',
    ft = "markdown",
    config = function()
      vim.fn["mkdp#util#install"]()
      vim.g.mkdp_preview_options = {
        toc= {
          listType = "ol",
          level = 2,
        }
      }
    end,
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    event = "BufReadPost",
    config = function()
      require("config.treesitter")
    end,
  },
  -- file browser
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ft", "<cmd>Neotree reveal_force_cwd<cr>", desc = "NeoTree" },
    },
    config = function()
      require("config.neo-tree")
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "MunifTanjim/nui.nvim" },
    },
  },
  -- buf
  {
    'akinsho/bufferline.nvim',
    config = function()
      local bufferline = require('bufferline')
      require("bufferline").setup({
	options = {
	  show_buffer_icons = false,
	  show_buffer_close_icons = false,
	  style_preset = bufferline.style_preset.no_italic,
	},
      })
    end,
  },
  -- comment
  {
    "numToStr/Comment.nvim",
    -- keys = {},
    keys = { "gcc", "gbc" },
    -- event = "BufReadPre",
    config = function()
        require('Comment').setup()
    end
  },
  {
    "tpope/vim-unimpaired",
    keys = { "[", "]" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("config.hop")
    end,
  },
  {
    "dense-analysis/ale",
    config = function()
      require("config.ale")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("config.lsp-config")
    end,
  },
  -- {
  --   "yioneko/nvim-cmp", -- See: https://is.gd/eFWo0W
  --   dependencies = {
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "dcampos/cmp-snippy",
  --   },
  --   event = "InsertEnter",
  --   config = function()
  --     require("config.cmp")
  --   end,
  -- },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("config.autopairs")
    end,
  },
  {
    "j-hui/fidget.nvim",
    ft = { "dart", "javascript", "ruby", "rust" },
    opts = { text = { spinner = "dots" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = function()
      require("config.gitsigns")
    end,
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>" },
    },
  },
  {
    "fatih/vim-go",
    ft = "go",
    cmd = "GoImports",
    keys = {
      {"<C-i>", "<cmd>GoImports<cr>"},
    },
    config = function()
      vim.g.go_version_warning = 0
      vim.g.go_code_completion_enabled = 0
      vim.g.go_play_open_browser = 0
      vim.g.go_jump_to_error = 0
      vim.g.go_fmt_autosave = 0
      vim.g.go_mod_fmt_autosave = 0
      vim.g.go_doc_keywordprg_enabled = 0
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_search_bin_path_first = 0
      vim.g.go_get_update = 0
      vim.g.go_textobj_enabled = 0
      vim.g.go_textobj_include_function_doc = 0
      vim.g.go_textobj_include_variable = 0
      vim.g.go_list_autoclose = 0
      vim.g.go_term_close_on_exit = 0
      vim.g.go_gopls_enabled = 0
      vim.g.go_template_autocreate = 0
      vim.g.go_echo_command_info = 0
      vim.g.go_echo_go_info = 0
      vim.g.go_highlight_string_spellcheck = 0
      vim.g.go_highlight_format_strings = 0
      vim.g.go_highlight_diagnostic_errors = 0
      vim.g.go_highlight_diagnostic_warnings = 0
      vim.g.go_highlight_debug = 0
    end,
  },
  {
    'Shougo/ddc.vim',
    event = 'InsertEnter',
    lazy = true,
    dependencies = {
      'vim-denops/denops.vim',
      'Shougo/ddc-ui-native',
      'LumaKernel/ddc-file',
      'Shougo/ddc-source-around',
      'Shougo/ddc-matcher_head',
      'Shougo/ddc-sorter_rank',
      'Shougo/ddc-converter_remove_overlap',
      'Shougo/ddc-source-nvim-lsp',
      'matsui54/denops-popup-preview.vim',
      'matsui54/denops-signature_help',
    },
    config = function()
      vim.opt.completeopt:remove('preview')

      vim.fn['ddc#custom#patch_global']({
        ui = 'native',
        sources = { 'file', 'nvim-lsp', 'around' },
        sourceOptions = {
          _ = {
            matchers = { 'matcher_head' },
            sorters = { 'sorter_rank' },
            converters = { 'converter_remove_overlap' },
            minAutoCompleteLength = 1,
          },
          around = {
            mark = 'A',
          },
          file = {
            mark = 'F',
            isVolatile = true,
            forceCompletionPattern = '\\S/\\S*',
          },
          ['nvim-lsp'] = {
            mark = 'LSP',
            dup = true,
            forceCompletionPattern = '\\.\\w*|:\\w*|->\\w*',
          },
        },
        sourceParams = {
          around = {
            maxSize = 30
          },
          ['nvim-lsp'] = {
            maxSize = 500
          },
        },
        filterParams = {
          matcher_fuzzy = {
            splitMode = 'character'
          },
          converter_fuzzy = {
            hlGroup = 'SpellBad'
          }
        }
      })

      vim.api.nvim_call_function('ddc#enable', {})
    end
  },
},{
  lazy = true,
})
