call plug#begin()

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set number
" set nonumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ai
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set incsearch
set termguicolors
set backspace=indent,eol,start
set belloff=all
set ic


syntax on
packadd! dracula
colorscheme dracula

hi Normal guibg=NONE ctermbg=NONE

au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
