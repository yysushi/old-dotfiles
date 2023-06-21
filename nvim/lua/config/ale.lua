if vim.opt.diff:get() then
  return
end

vim.g.ale_fixers = {
  ["*"] = { "remove_trailing_lines", "trim_whitespace" },
  css = { "prettier" },
  cpp = { "clang-format" },
  dart = { "dart-format" },
  go = { "gofmt" },
  html = { "prettier" },
  javascript = { "eslint" },
  json = { "prettier" },
  jsonnet = { "jsonnetft" },
  nix = { "nixpkgs-fmt" },
  proto = { "buf-format" },
  python = { "black", "isort" },
  rust = { "rustfmt" },
  terraform = { "terraform" },
  toml = { "dprint" },
  typescript = { "deno" },
}

vim.g.ale_linters = {
  cpp = { "clang" },
  css = { "csslint" },
  dart = { "dart_analyze" },
  dockerfile = { "hadolint" },
  go = { "golangci-lint" },
  html = { "tidy" },
  json = { "jsonlint" },
  jsonnet = { "jsonnet-lint" },
  lua = { "luac" },
  make = { "checkmake" },
  markdown = { "markdownlint" },
  nix = { "nix" },
  proto = { "buf_lint" },
  python = { "flake8", "mypy", "pylint" },
  rst = { "rstcheck" },
  sh = { "shellcheck" },
  sql = { "sqlint" },
  tf = { "tflint" },
  typescript = { "tslint" },
  vim = { "vint" },
  yaml = { "yamllint" },
}

vim.g.ale_echo_msg_format = '%linter% says %code%: %s'
vim.g.ale_virtualtext_cursor = 0
-- vim.g.ale_cursor_detail = 1
vim.g.ale_lint_delay = 10
vim.g.ale_linters_explicit = 1
vim.g.ale_go_golangci_lint_package = 1
vim.g.ale_go_golangci_lint_options = '--enable-all'
vim.g.ale_python_mypy_options = '--config-file ~/.config/mypy/config'
vim.g.ale_cpp_clang_executable = 'clang++'
vim.g.ale_cpp_clang_options = '-std=c++14 -Wall -Wextra -O2'
vim.g.ale_javascript_eslint_options = '--config ~/.eslintrc.json --resolve-plugins-relative-to=$(npm root -g)'
vim.g.ale_cpp_clangformat_options = '-style=google'
vim.g.ale_completion_enabled = 0
vim.g.ale_detail_to_floating_preview = 1
vim.g.ale_floating_window_border = {'│', '─', '┌', '┐', '┘', '└', '│', '─'}

vim.g.ale_disable_lsp = 1
vim.g.ale_echo_cursor = 1
