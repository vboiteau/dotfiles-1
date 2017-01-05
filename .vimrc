execute pathogen#infect()
filetype plugin indent on
syntax on
set nocompatible
set number
set relativenumber
set rtp+=/Users/vboiteau/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set runtimepath+=~/.vim/bundle/ultisnips/
set laststatus=2
set showtabline=2
set noshowmode
colorscheme Tomorrow-Night-Bright
set foldcolumn=2
set foldmethod=syntax
set t_Co=256
hi Normal ctermbg=NONE
imap jj <ESC>
set ts=4 sts=4 sw=4 expandtab
set hidden
if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
	autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd FileType plantuml imap jj <ESC>:w<CR>
    autocmd FileType plantuml set fmr=class*{,} fdm=marker fdc=1
    autocmd FileType xml vmap <C-b> :%!xmllint --encode UTF-8 --format -<CR>
endif
augroup markdown
    au!
augroup END
let mapleader = ","
let maplocalleader = ",,"
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>s :write<CR>
let g:tmux_navigator_no_mappings = 1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/vim-snippets/UltiSnips']
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>let g:tmux_navigator_save_on_switch = 2
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
