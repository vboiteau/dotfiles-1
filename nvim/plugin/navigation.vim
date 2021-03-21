nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <C-o> :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        endif
    else
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        endif
    endif
endfun
