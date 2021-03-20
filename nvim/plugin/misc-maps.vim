nnoremap <leader>S :s/\<<C-r><C-w>\>/
nnoremap <leader>gS :%s/\<<C-r><C-w>\>/
nnoremap <leader>gP :Ggrep "\<<C-r><c-w>\>"

" Show syntax highlighting groups for word under cursor
nmap <F2> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
