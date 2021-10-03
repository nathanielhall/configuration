
lua require("nathanielhall")


nnoremap <leader>ff :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer=false}))<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer=false}))<cr>

nnoremap <leader>fs <cmd>lua require('telescope.builtin').find_files()<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>


