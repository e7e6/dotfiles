
set nocompatible
execute pathogen#infect()

"-----------------------------------------
" Display settings

set guioptions-=T
set guioptions-=r
set guioptions-=L

set title
set cursorline
set number

set scrolloff=1
set backspace=indent,eol,start
"-----------------------------------------
" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

"-----------------------------------------
" Syntax 
filetype plugin indent on
syntax on
set nospell
"-----------------------------------------
" Beep
" set visualbell
set noerrorbells


"-----------------------------------------
" Font
set guifont=Monaco\ 11
" set antialias
"
"-----------------------------------------
"colorscheme molokai
if has('gui_running')
	set background=light
	colorscheme solarized
endif

"-----------------------------------------
" Extra Plugins
" autocmd vimenter * NERDTree


"-----------------------------------------

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

