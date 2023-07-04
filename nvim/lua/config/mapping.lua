vim.api.nvim_set_keymap('n', '<Leader>q', [[ <Cmd>:q<CR> ]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>Q', [[ <Cmd>:qa!<CR> ]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>c', [[ <Cmd>:cclose<bar>lclose<CR> ]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>f', [[ <Cmd>:ALEFix<CR> ]], {noremap = true})
