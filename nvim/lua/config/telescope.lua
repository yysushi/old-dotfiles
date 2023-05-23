local telescope = require("telescope")
-- local actions = require("telescope.actions")

telescope.setup({
  -- defaults = {
    -- mappings = {
    --   i = {
    --     ["<ESC>"] = actions.close,
    --     ["<PageUp>"] = actions.preview_scrolling_up,
    --     ["<PageDown>"] = actions.preview_scrolling_down,
    --     ["<C-q>"] = false,
    --     ["<A-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    --     ["<A-d>"] = require("telescope.actions").delete_buffer,
    --     ["<C-f>"] = actions.results_scrolling_down,
    --     ["<C-b>"] = actions.results_scrolling_up,
    --   },
    -- },
  -- },
  pickers = {
    find_files = {
      disable_devicons = true
    },
    live_grep = {
      disable_devicons = true
    },
    buffers = {
      disable_devicons = true
    },
  },
})
