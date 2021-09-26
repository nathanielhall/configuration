
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc



set termguicolors

set wildmode=longest,list,full
set wildmenu
"
" Ignore Files
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*



call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'theprimeagen/vim-be-good'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'  

" test these
" Plug 'hrsh7th/nvim-compe'

" javascript / jsx
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" typescript / jsx
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"
Plug 'herrbischoff/cobalt2.vim'
"
" 
Plug 'tpope/vim-fugitive'
call plug#end()


colorscheme cobalt2

" Change style for Comment (must run AFTER colorscheme)
:hi Comment ctermfg=33 ctermbg=NONE cterm=NONE guifg=#0878F4 guibg=NONE gui=italic

let mapleader = " "

lua require("nathanielhall")

inoremap jj <ESC> 

nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules'] 
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeShowHidden=1
nmap ,n :NERDTreeFind<CR>

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

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
noremap <leader>k :m .-2<CR>==
noremap <leader>j :m .+1<CR>==


" duplicate
xnoremap <leader>p "_dP
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Vim Split remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" nnoremap <Leader>w <C-w>
nnoremap ,w <C-w>


nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
noremap <Leader>rp :resize 100<CR>

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

nnoremap <leader>x :!chmod +x %<CR>
nnoremap <leader>b :bprev<cr>
nnoremap <leader>n :bnext<cr>


" TODO: Remove coc and replace with nvim-lsp client
" coc conig
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]


" if project using prettier, enable it
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" if project using eslint, enable it
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif


nnoremap <silent> K :call CocAction('doHover')<CR>


function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()


" Navigating
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nmap <leader>do <Plug>(coc-codeaction)

