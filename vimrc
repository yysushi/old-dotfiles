" vim: set foldmethod=marker foldlevel=0 nomodeline:

" plugins {{{
"
" vim-plug https://github.com/junegunn/vim-plug
" file type https://github.com/vim/vim/blob/master/runtime/filetype.vim

call plug#begin()

" lint, fix {{{
"
" ale https://github.com/dense-analysis/ale
" only lint and fix are enabled
" others (completion, definition, reference, hover and symbol) are disabled

Plug 'dense-analysis/ale'
  let g:ale_lint_delay = 1000
  let g:ale_linters_explicit = 1
  let g:ale_linters = {
      \ 'cpp': ['clang'],
      \ 'css': ['csslint'],
      \ 'dockerfile': ['hadolint'],
      \ 'go': ['golint', 'govet'],
      \ 'html': ['tidy'],
      \ 'json': ['jsonlint'],
      \ 'javascript': ['eslint'],
      \ 'markdown': ['markdownlint'],
      \ 'python': ['flake8'],
      \ 'rst': ['rstcheck'],
      \ 'sh': ['shellcheck'],
      \ 'sql': ['sqlint'],
      \ 'typescript': ['tslint'],
      \ 'vim': ['vint'],
      \ 'yaml': ['yamllint']
      \ }
  let g:ale_cpp_clang_executable = 'clang++'
  let g:ale_cpp_clang_options = '-std=c++14 -Wall -Wextra -O2'
  let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'css': ['prettier'],
      \ 'cpp': ['clang-format'],
      \ 'go': ['gofmt'],
      \ 'html': ['prettier'],
      \ 'javascript': ['eslint'],
      \ 'json': ['prettier'],
      \ 'python': ['black'],
      \ 'rust': ['rustfmt'],
      \ 'typescript': ['tslint'],
      \ }
  let g:ale_fix_on_save = 0
  let g:ale_cpp_clangformat_options = '-style=google'
  let g:ale_completion_enabled = 0

" }}}

" lsp {{{

Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
  let g:lsp_async_completion = 1
  let g:lsp_diagnostics_echo_cursor = 1
  " let g:lsp_log_verbose = 1
  " let g:lsp_log_file = expand("~/.vim-lsp.log")

" }}}

" navigtion {{{

Plug 'scrooloose/nerdtree'

Plug 'jiangmiao/auto-pairs'

Plug 'easymotion/vim-easymotion'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" }}}

" language specific {{{

" requisite: apt install clang llvm build-essentials clang-tools
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'leafgarland/typescript-vim', { 'type': 'typescript' }

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
""" koketani:doc (master=)$ grep -o \"let g:[^ ]* = 1\" vim-go.txt | sed  's/1/0/g'
  let g:go_version_warning = 0
  let g:go_code_completion_enabled = 0
  let g:go_play_open_browser = 0
  let g:go_jump_to_error = 0
  let g:go_fmt_autosave = 0
  let g:go_mod_fmt_autosave = 0
  let g:go_doc_keywordprg_enabled = 0
  let g:go_def_mapping_enabled = 0
  let g:go_search_bin_path_first = 0
  let g:go_get_update = 0
  let g:go_textobj_enabled = 0
  let g:go_textobj_include_function_doc = 0
  let g:go_textobj_include_variable = 0
  let g:go_list_autoclose = 0
  let g:go_term_close_on_exit = 0
  let g:go_gopls_enabled = 0
  let g:go_template_autocreate = 0
  let g:go_echo_command_info = 0
  let g:go_echo_go_info = 0
  let g:go_highlight_string_spellcheck = 0
  let g:go_highlight_format_strings = 0
  let g:go_highlight_diagnostic_errors = 0
  let g:go_highlight_diagnostic_warnings = 0
  let g:go_highlight_debug = 0

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'thinca/vim-quickrun'
  let g:quickrun_config = get(g:, 'quickrun_config', {})
  let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/sleep': 50,
      \ 'runner/vimproc/updatetime' : 60,
      \ 'runner/vimproc/read_timeout': 100,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
  let g:quickrun_config.cpp = {
      \ 'command' : 'clang++',
      \ 'cmdopt' : '-std=c++14 -Wall -Wextra -O2',
      \ }
  let g:quickrun_no_default_key_mappings = 1

Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
  let g:slumlord_separate_win = 1

Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
  let g:user_emmet_mode='n'

Plug 'previm/previm'

" }}}

" completion {{{

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
  let g:deoplete#enable_at_startup = 1

Plug 'mattn/sonictemplate-vim'
  let g:sonictemplate_vim_template_dir = '$HOME/.dotfiles/template'

"}}}

" appearance {{{

Plug 'Yggdroot/indentLine'
  let g:indentLine_char = '|'

Plug 'chriskempson/base16-vim'
Plug 'fxn/vim-monochrome'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"}}}

" others {{{

Plug 'tyru/open-browser.vim'

" Plug 'terryma/vim-multiple-cursors'
" Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'

Plug 'rhysd/vim-grammarous'

Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'

" }}}

call plug#end()

" }}}

" general {{{

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" colorscheme monochrome

set number
set ruler
set clipboard=unnamed
set noswapfile
set expandtab

" }}}

" key {{{

let mapleader      = ' '
let maplocalleader = ' '

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>f :ALEFix<cr>
nnoremap <leader>d :LspDefinition<cr>
nnoremap <leader>h :LspHover<cr>
nnoremap <leader>rn :LspRename<cr>
nnoremap <leader>rf :LspReference<cr>
nnoremap <leader>ne :LspNextError<cr>
nnoremap <leader>e :LspNextError<cr>
nnoremap <leader>pe :LspPreviousError<cr>
" gopls not support..
" nnoremap <leader>td :LspTypeDefinition<cr>

nmap gx <Plug>(openbrowser-open)

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <leader>l :Limelight<cr>
xnoremap <leader>l :Limelight<cr>

" }}}

" autocmd {{{

" lsp {{{
"
" requisite: clangd, clang-format
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
" set cpp's indent size according to clang-format (cinoptions-values)
autocmd Filetype cpp setlocal sw=2 sts=2

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server-ts',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server-js',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
endif

" requisite: https://download.eclipse.org/jdtls/milestones
"       \     '-classpath /usr/local/Cellar/maven/3.6.3/libexec/boot/plexus-classworlds-2.6.0.jar',
if executable('java')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     '/usr/bin/java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     fnamemodify("~", ":p") . '/.eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.600.v20191014-2022.jar',
        \     '-configuration',
        \     fnamemodify("~", ":p") . '/.eclipse.jdt.ls/config_mac',
        \     '-data',
        \     fnamemodify("~", ":p") . '/.eclipse.jdt.ls/workspace'
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

" }}}

" shiftwidth, tabstop and fold option {{{

au Filetype cucumber setlocal shiftwidth=2 foldmethod=indent foldlevel=1 foldnestmax=3
au Filetype go setlocal shiftwidth=8 tabstop=8 noexpandtab
au Filetype javascript setlocal shiftwidth=4
au Filetype json setlocal shiftwidth=2
au Filetype python setlocal shiftwidth=4
au Filetype yaml setlocal shiftwidth=2

" }}}

" }}}
