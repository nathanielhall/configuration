set autoindent
set noerrorbells
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set nohlsearch
set smartcase
set noswapfile
set nobackup
set incsearch
set scrolloff=8

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
call plug#end()

inoremap jj <ESC>


colorscheme gruvbox



