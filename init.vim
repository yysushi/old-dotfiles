call plug#begin()

tnoremap <silent> <ESC> <C-\><C-n>

"" general
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'junegunn/vim-easy-align'
" Plug 'jiangmiao/auto-pairs'

"" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

"" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" run command
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Shougo/vimshell'
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
    \ 'cmdopt' : '-std=c++14 -g -Wall -Wextra -O2',
    \ }
let g:quickrun_no_default_key_mappings = 1

"" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" lint/fix/completion/definition/reference/hover/symbol by ale
Plug 'w0rp/ale'
let g:ale_lint_delay = 1000
let g:ale_linters_explicit = 1
" requsite: pip install flake8 yamllint
let g:ale_linters = {
    \ 'cpp': ['clang'],
    \ 'javascript': ['eslint'],
    \ 'python': ['flake8'],
    \ 'yaml': ['yamllint']
    \ }
let g:ale_cpp_clang_executable = 'clang++'
let g:ale_cpp_clang_options = '-std=c++14 -g -Wall -Wextra -O2'
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'cpp': ['clang-format'],
    \ }
let g:ale_fix_on_save = 0
let g:ale_cpp_clangformat_options = '-style=google'
let g:ale_completion_enabled = 0

"" template
Plug 'mattn/sonictemplate-vim'
let g:sonictemplate_vim_template_dir = '$HOME/.dotfiles/template'

"" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"" lsp for python
" pip install python-language-server
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

"" cpp
" requisite: apt install clang llvm build-essentials
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
let g:deoplete#sources#clang#std = { 'cpp': 'c++14' }

"" golang
Plug 'fatih/vim-go'

"" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

"" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

"" toml
Plug 'cespare/vim-toml', { 'for': 'toml' }

"" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" https://github.com/rust-lang-nursery/rustfmt#installation
let g:rustfmt_autosave = 1

"" docker
Plug 'honza/dockerfile.vim'

"" plantuml
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
let g:slumlord_separate_win = 1

call plug#end()

"" coloring
colorscheme base16-ocean
"" numbering
set number
set ruler
" set spell
"" clipboard; share vim's yank and mac's clipboard
set clipboard+=unnamedplus
set autoindent
set cindent
" set cpp's indent size according to clang-format
" check `cinoptions-values`
autocmd Filetype cpp setlocal sw=2 sts=2
