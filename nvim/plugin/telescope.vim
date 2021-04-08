lua require('vboiteau')

nnoremap <localleader>p <cmd>Telescope live_grep<CR>
nnoremap <localleader>f :lua require('telescope.builtin').git_files()<CR>
nnoremap <localleader>F :lua require('telescope.builtin').git_status()<CR>
nnoremap <localleader>b :lua require('telescope.builtin').buffers()<CR>
nnoremap <localleader>l <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <localleader>h :lua require('telescope.builtin').help_tags()<CR>
nnoremap <localleader>H <cmd>Telescope highlights<CR>
nnoremap <localleader>t <cmd>Telescope treesitter<CR>
nnoremap <localleader>k <cmd>Telescope keymaps<CR>
nnoremap <localleader>q <cmd>Telescope quickfix<CR>
nnoremap <localleader>L <cmd>Telescope loclist<CR>
nnoremap <localleader>c <cmd>Telescope git_bcommits<CR>
nnoremap <localleader>C <cmd>Telescope git_commits<CR>
nnoremap <localleader>r <cmd>Telescope git_branches<CR>
nnoremap <localleader>d :lua require('vboiteau.telescope').search_dotfiles()<CR>
