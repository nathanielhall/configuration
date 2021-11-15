lua require("nathanielhall")

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
"let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_git_hl = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_icon_padding = 1

let g:nvim_tree_indent_markers = 0

let g:nvim_tree_respect_buf_cwd = 1 

" TODO: Move these color files
" Set Folder Icon Color
 hi! NvimTreeFolderIcon guifg=#f5c06f 
 hi! NvimTreeNormal guibg=#15232d
" Telescope
hi! TelescopeNormal guibg=#15232d


hi! NvimTreeFolderName guifg=#bdbdbd
hi! NvimTreeOpenedFolderName guifg=#bdbdbd
hi! NvimTreeRootFolder guifg=#bdbdbd
hi! NvimTreeEmptyFolderName guifg=#aaaaaa

" Files
hi! NvimTreeOpenFile guibg=#aaaaaa
hi! NvimTreeSymlink guifg=#aaaaaa
hi! NvimTreeSpecialFile guifg=#aaaaaa
hi! NvimTreeExecFile guifg=#aaaaaa
hi! NvimTreeMarkdownFile guifg=#aaaaaa

hi! EndOfBuffer guibg=NONE

" enabling this will break color settings!
"let g:nvim_tree_highlight_opened_files = 1
"
"Default Actions
"https://github.com/kyazdani42/nvim-tree.lua#default-actions

nnoremap <leader>e :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>z :NvimTreeFindFile<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

"let g:nvim_tree_git_hl
  let g:nvim_tree_icons = {
      \ 'default':        '',
      \ 'symlink':        '>',
      \ 'git': {
      \   'unstaged':     "✗",
      \   'staged':       "✓",
      \   'unmerged':     "",
      \   'renamed':      "➜",
      \   'untracked':    "★",
      \   'deleted':      "",
      \  },
      \ 'folder': {
      \   'arrow_open':   "",
      \   'arrow_closed': "",
      \   'default':      "",
      \   'open':         "",
      \   'empty':        "",
      \   'empty_open':   "",
      \   'symlink':      "",
      \   'symlink_open': "",
      \  },
      \  'lsp': {
      \    'hint': "",
      \    'info': "",
      \    'warning': "",
      \    'error': "",
      \  }
      \ }


let g:nvim_tree_show_icons = {
	\ 'git': 1,
	\ 'folders': 1,
	\ 'files': 1,
  \ 'folder_arrows': 1,
	\}

