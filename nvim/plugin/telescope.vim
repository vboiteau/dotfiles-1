nnoremap <localleader>p <cmd>Telescope live_grep<CR>
nnoremap <localleader>f :lua require('telescope.builtin').git_files()<CR>
nnoremap <localleader>F :lua require('telescope.builtin').find_files()<CR>

nnoremap <localleader>b :lua require('telescope.builtin').buffers()<CR>
nnoremap <localleader>h :lua require('telescope.builtin').help_tags()<CR>
