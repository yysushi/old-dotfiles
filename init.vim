call plug#begin()

tnoremap <silent> <ESC> <C-\><C-n>

"" general
Plug 'chriskempson/base16-vim'
Plug 'Shougo/vimshell'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
Plug 'terryma/vim-multiple-cursors'
" Plug 'junegunn/vim-easy-align'
" Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'

"" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" general syntax
" stop to use
" Plug 'scrooloose/syntastic'
" instead of the above
Plug 'w0rp/ale'
let g:ale_fixers = { 'javascript': ['eslint'], }
Plug 'mattn/sonictemplate-vim'
let g:sonictemplate_vim_template_dir = [
\ '$HOME/.config/nvim/plugged/sonictemplate-vim/template',
\ '$HOME/.dotfiles/template'
\]

"" cpp
Plug 'vim-jp/vim-cpp', { 'for': 'cpp'}

"" golang
Plug 'fatih/vim-go'

"" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

"" python
" Plug 'nvie/vim-flake8', { 'for': 'python' }
" Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
let g:jedi#force_py_version=3
" let g:syntastic_python_checkers = ["flake8"]
" let g:syntastic_python_flake8_args="--max-line-length=100"

"" javascript
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }

"" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

"" yaml
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'adrienverge/yamllint', { 'for': 'yaml' }

"" toml
Plug 'cespare/vim-toml', { 'for': 'toml' }

"" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

"" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" https://github.com/rust-lang-nursery/rustfmt#installation
let g:rustfmt_autosave = 1

call plug#end()

"" coloring
" set termguicolors
" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean
" colorscheme base16-materia
" colorscheme base16-solarized-dark
"" numbering
set number
set ruler
" set spell
"" clipboard; share vim's yank and mac's clipboard
set clipboard+=unnamedplus
