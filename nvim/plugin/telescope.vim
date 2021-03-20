nnoremap <localleader>p :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <localleader>f :lua require('telescope.builtin').git_files()<CR>
nnoremap <localleader>F :lua require('telescope.builtin').find_files()<CR>

nnoremap <localleader>P :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <localleader>b :lua require('telescope.builtin').buffers()<CR>
nnoremap <localleader>h :lua require('telescope.builtin').help_tags()<CR>
