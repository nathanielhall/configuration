lua require("nathanielhall")

" Git
nnoremap <leader>gb :lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({previewer=false}))<cr>
" nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_stash()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>ga <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>gt <cmd>lua require('telescope.builtin').git_status()<cr>

" Grep
nnoremap <leader>lg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>gg <cmd>lua require('telescope.builtin').grep_string()<cr>

" LSP
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>


" Vim Lists
nnoremap <leader>fh <cmd>lua require('telescope.builtin').jumplist()<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').quickfix()<cr>


" Buffers

"nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fo :lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({previewer=false}))<cr>
nnoremap <C-n> :lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer=false}))<cr>

" nnoremap <leader>fn <cmd>lua require('telescope.builtin').buffers()<cr>

" ============================================"



nnoremap <leader>ff :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({previewer=false}))<cr>

nnoremap <leader>fs <cmd>lua require('telescope.builtin').find_files()<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

"nnoremap <leader>ft :lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>
nnoremap <leader>fa :lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown({previewer=false}))<cr>




nnoremap <leader>vrc :lua require('nathanielhall.telescope').search_dotfiles(require('telescope.themes').get_dropdown({previewer=false}))<CR>

nnoremap <leader>vx <cmd>lua require('nathanielhall.telescope').git_branches()<cr>

 "Using Lua functions
nnoremap <leader>fv <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>fu <cmd>lua require('telescope.builtin').file_browser()<cr>

nnoremap <leader>fm <cmd>lua require('telescope.builtin').search_history()<cr>

nnoremap <leader>fc <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>




