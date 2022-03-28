" TODO copy vimrc settings here and remove following lines
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set termguicolors

set wildmode=longest,list,full
set wildmenu
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

set splitbelow
set splitright
set lazyredraw

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

" Autocomplete
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/cmp-calc', {'branch': 'main'}
Plug 'ray-x/cmp-treesitter'
Plug 'quangnguyen30192/cmp-nvim-tags', {'branch': 'main'}
Plug 'windwp/nvim-autopairs'
" Plug 'glepnir/lspsaga.nvim'

" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'gertjanreynaert/cobalt2-vim-theme'

" File Management
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'  

" javascript / jsx
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"  Git
Plug 'tpope/vim-fugitive'

" Icons / Tree
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kyazdani42/nvim-tree.lua'

" Others
Plug 'scrooloose/nerdcommenter'
Plug 'theprimeagen/vim-be-good'

Plug 'jose-elias-alvarez/nvim-lsp-ts-utils', {'branch': 'main'}

call plug#end()


let mapleader = " "

lua require("nathanielhall")
 
set guifont=DankMono\ Nerd\ Font\ Regular:h12
let g:airline_powerline_fonts = 1

if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" ===============
"     REMAPS
" ===============
inoremap jj <ESC> 

nnoremap H ^
xnoremap H ^
onoremap H ^
nnoremap L $
xnoremap L $
onoremap L $

nnoremap Y y$

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

xnoremap <leader>p "_dP

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <Leader><CR> :w<CR>

" Vim Split remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nnoremap <Leader>w <C-w>
nnoremap ,w <C-w>

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
noremap <Leader>rp :resize 100<CR>

nnoremap <leader>x :!chmod +x %<CR>

nnoremap <leader>b :bprev<cr>
nnoremap <leader>n :bnext<cr>

nnoremap <silent> gb :BufferLinePick<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" ===========================================================
"autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
"autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear




