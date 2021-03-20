let g:fzf_colors =
\ { 'bg': ['bg', 'Pmenu'] }

nnoremap <localleader>b :Buffers<cr>
nnoremap <localleader>c :Commits<cr>
nnoremap <localleader>f :GFiles<cr>
nnoremap <localleader>F :GFiles?<cr>
nnoremap <localleader>h :Helptags<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"
" Try to keep swapfiles in one system-appropriate dir
" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

inoremap <leader>t <c-x><c-]>
inoremap <leader>n <c-x><c-n>
inoremap <leader>o <c-x><c-n>
inoremap <leader>f <c-x><c-f>
inoremap <leader>l <c-x><c-l>
