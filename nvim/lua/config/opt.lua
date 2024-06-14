vim.opt.number = true
-- vim.opt.ruler = true
vim.opt.swapfile = false
-- vim.opt.expandtab = true
-- set clipboard+=unnamedplus
-- set belloff=all
-- set splitright
vim.opt.splitright = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
-- set hidden

local vimrcgroup = vim.api.nvim_create_augroup('vimrc', { clear = false })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.js',
  group = vimrcgroup,
  command = 'set shiftwidth=2',
})
