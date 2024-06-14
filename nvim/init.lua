require('config.opt')
require('config.mapping')

require('plugins')

-- vim.treesitter.language.register('jinja', 'j2')

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jinja2 = {
  install_info = {
    url = "https://github.com/dbt-labs/tree-sitter-jinja2", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "main", -- default branch in case of git repo if different from master
  },
  filetype = "jinja2", -- if filetype does not match the parser name
}
