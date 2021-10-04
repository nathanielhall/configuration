lua require("nathanielhall")

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
"let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_icon_padding = 2

" enabling this will break color settings!
"let g:nvim_tree_highlight_opened_files = 1

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>z :NvimTreeFindFile<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

