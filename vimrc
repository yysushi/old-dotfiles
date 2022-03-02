" vim: set foldmethod=marker foldlevel=0 nomodeline:

" python path for neovim {{{

if has('nvim')
  let g:python_host_prog = fnamemodify(expand('~/.asdf/shims/python'), ':p')
  let g:python3_host_prog = fnamemodify(expand('~/.asdf/shims/python3'), ':p')
endif

"}}}

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
      \ 'proto': ['protolint'],
      \ 'python': ['flake8'],
      \ 'rst': ['rstcheck'],
      \ 'sh': ['shellcheck'],
      \ 'sql': ['sqlint'],
      \ 'tf': ['tflint'],
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
      \ 'proto': ['ale#fixers#protolint#Fix'],
      \ 'python': ['black'],
      \ 'rust': ['rustfmt'],
      \ 'tf': ['terraform'],
      \ 'typescript': ['tslint'],
      \ }
  let g:ale_fix_on_save = 0
  let g:ale_javascript_eslint_options = '--config ~/.eslintrc.json --resolve-plugins-relative-to=$(npm root -g)'
  let g:ale_cpp_clangformat_options = '-style=google'
  let g:ale_completion_enabled = 0

" }}}

" lsp {{{

Plug 'prabirshrestha/vim-lsp'
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" }}}

" navigtion {{{

Plug 'scrooloose/nerdtree'

Plug 'jiangmiao/auto-pairs'
" :call AutoPairsToggle()

Plug 'easymotion/vim-easymotion'
" <Leader><Leader>s

Plug 'junegunn/vim-easy-align'
" vipga=
" gaip=

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
Plug 'rhysd/rust-doc.vim', { 'for': 'rust' }

Plug 'leafgarland/typescript-vim', { 'type': 'typescript' }

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
""" yysushi:doc (master=)$ grep -o \"let g:[^ ]* = 1\" vim-go.txt | sed  's/1/0/g'
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

Plug 'yysushi/vim-slumlord', { 'branch': 'window_option' }
" SlumlordToggle
Plug 'aklt/plantuml-syntax'
  let g:slumlord_separate_win = 1
  let g:slumlord_separate_win_horizontal = 0

Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
  let g:user_emmet_mode='n'

Plug 'previm/previm'

Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs', 'for': ['php']}

Plug 'udalov/kotlin-vim'

Plug 'tsandall/vim-rego'

Plug 'hashivim/vim-terraform', { 'for': 'tf' }

" }}}

" completion {{{

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
  let g:deoplete#enable_at_startup = 1

Plug 'mattn/sonictemplate-vim'
  let g:sonictemplate_vim_template_dir = '$HOME/.dotfiles/template'

"}}}

" appearance {{{

Plug 'Yggdroot/indentLine'
  let g:indentLine_char = '|'

Plug 'chriskempson/base16-vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'ap/vim-buftabline'
  let g:buftabline_show = 1
  let g:buftabline_numbers = 1

"}}}

" others {{{

Plug 'tyru/open-browser.vim'

Plug 'tpope/vim-surround'

Plug 'rhysd/vim-grammarous'

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
"" see :help clipboard
" set clipboard+=unnamedplus
set noswapfile
set expandtab
set belloff=all
set splitright
set cursorcolumn cursorline

" }}}

" key {{{

" default leader key
" let mapleader = '\'
" let maplocalleader = '\'

" default terminal-mode exit key
" tnoremap <Esc>

nnoremap <leader>n :NERDTreeFind<cr>
nnoremap <leader>f :ALEFix<cr>

nmap gx <Plug>(openbrowser-open)

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :cclose<bar>lclose<cr>

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" }}}

" autocmd {{{

" lsp {{{
"
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
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
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
        \ })
endif
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript support using typescript-language-server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
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
        \ 'cmd': {server_info->['rustup', 'run', '1.48.0', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

if executable('solargraph')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif

au User lsp_setup call lsp#register_server({
     \ 'name': 'php-language-server',
     \ 'cmd': {server_info->['php', expand('~/.config/nvim/plugged/php-language-server/bin/php-language-server.php')]},
     \ 'whitelist': ['php'],
     \ })

if executable(expand('~/lsp/kotlin-language-server/server/bin/kotlin-language-server'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'kotlin-language-server',
        \ 'cmd': {server_info->[
        \     &shell,
        \     &shellcmdflag,
        \     expand('~/lsp/kotlin-language-server/server/bin/kotlin-language-server')
        \ ]},
        \ 'whitelist': ['kotlin']
        \ })
endif

if executable('bash-language-server')
  augroup LspBash
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  augroup END
endif

" }}}

" shiftwidth, tabstop and fold option {{{

au Filetype cucumber setlocal shiftwidth=2 foldmethod=indent foldlevel=1 foldnestmax=3
au Filetype go setlocal shiftwidth=8 tabstop=8 noexpandtab
au Filetype javascript setlocal shiftwidth=2
au Filetype json setlocal shiftwidth=2
au Filetype python setlocal shiftwidth=4
au Filetype yaml setlocal shiftwidth=2

" }}}

" {{{ sync limelight with goyo

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}

" }}}
