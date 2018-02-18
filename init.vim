call plug#begin()

tnoremap <silent> <ESC> <C-\><C-n>

"" general
Plug 'chriskempson/base16-vim'
Plug 'Shougo/vimshell'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
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

"" golang
Plug 'fatih/vim-go'

"" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

"" python
" Plug 'nvie/vim-flake8', { 'for': 'python' }
" Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" let g:syntastic_python_checkers = ["flake8"]
" let g:syntastic_python_flake8_args="--max-line-length=100"

"" javascript
let g:ale_fixers = { 'javascript': ['eslint'], }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }

"" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

"" yaml
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }

"" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

call plug#end()

"" leader key
let mapleader = ","
"" coloring
" set termguicolors
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-tomorrow-night
colorscheme base16-ocean
"" numbering
set number
set ruler
"" clipboard; share vim's yank and mac's clipboard
set clipboard+=unnamedplus
