if has("autocmd")
    autocmd FileType make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType sass setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd FileType plantuml imap jj <ESC>:w<CR>
    autocmd FileType plantuml set foldmarker=class*{,} foldmethod=marker foldcolumn=1
    autocmd FileType xml vmap <C-b> :%!xmllint --encode UTF-8 --format -<CR>
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-node
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-jsdoc
    autocmd BufNewFile,BufReadPost Jenkinsfile* set filetype=groovy
    autocmd BufNewFile,BufReadPost *.puml set filetype=plantuml
    autocmd BufNewFile,BufReadPost *.uml set filetype=plantuml
    autocmd FileType plantuml let b:dispatch = 'plantuml %'
    function! s:MkNonExDir(file, buf)
        if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
            let dir=fnamemodify(a:file, ':h')
            if !isdirectory(dir)
                call mkdir(dir, 'p')
            endif
        endif
    endfunction
    augroup BWCCreateDir
        autocmd!
        autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    augroup END
    augroup FileTypeGroup
        autocmd!
        autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
        autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
    augroup END

    augroup highlight_follows_focus
        autocmd!
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline
    augroup END

    augroup hightlight_follows_vim
        autocmd!
        autocmd FocusGained * set cursorline
        autocmd FocusLost * set nocursorline
    augroup END
endif
