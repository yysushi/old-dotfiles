local highlights = require("neo-tree.ui.highlights")
require("neo-tree").setup({
  enable_diagnostics = false,
  enable_git_status = false,
  -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#components
  filesystem = {
    components = {
      icon = function(config, node, state)
        local icon = ""
        local padding = ""
        local highlight = config.highlight or highlights.FILE_ICON
        if node.type == "directory" then
          highlight = highlights.DIRECTORY_ICON
	end
        return {
          text = icon .. padding,
          highlight = highlight,
        }
      end,
    },
    -- ["h"] = function(state)
    --   local node = state.tree:get_node()
    --     if node.type == 'directory' and node:is_expanded() then
    --       require'neo-tree.sources.filesystem'.toggle_directory(state, node)
    --     else
    --       require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
    --     end
    --   end,
    -- ["l"] = function(state)
    --   local node = state.tree:get_node()
    --     if node.type == 'directory' then
    --       if not node:is_expanded() then
    --         require'neo-tree.sources.filesystem'.toggle_directory(state, node)
    --       elseif node:has_children() then
    --         require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
    --       end
    --     end
    --   end,
  },
  window = {
    width = 30,
  },
})
