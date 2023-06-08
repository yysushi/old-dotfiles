vim.api.nvim_create_user_command("SpellCheckOff", "setlocal nospell", { force = true })
vim.api.nvim_create_user_command("SpellCheckOn", "setlocal spell! spelllang=en_us", { force = true })
