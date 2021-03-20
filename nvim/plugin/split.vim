cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>eW :e<space> 
map <leader>eS :sp 
map <leader>eV :vsp 
map <leader>eT :tabe
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
nnoremap <leader>gp :grep<space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<cr>
nnoremap <leader>q :b#<cr>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>s :write<CR>

