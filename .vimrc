execute pathogen#infect()
Helptags
filetype plugin indent on
syntax on
set number
set clipboard+=unnamed
set relativenumber
set runtimepath+=~/.vim/bundle/ultisnips/
set showtabline=2
set noshowmode
colorscheme Tomorrow-Night-Bright
set foldcolumn=2
set foldlevelstart=1
set foldmethod=indent
set wildmode=longest,list,full
set wildmenu
set path+=**
set t_Co=256
hi Normal ctermbg=NONE
imap jj <ESC>
set ts=4 sts=4 sw=4 expandtab
set exrc
set laststatus=2
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" undo
set undofile
set undodir=~/.vim/undodir

" swp
set backupdir=~/.swp_files
set directory=~/.swp_files
set cc=100,180

" netrw
let g:netrw_banner = 0

if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd FileType plantuml imap jj <ESC>:w<CR>
    autocmd FileType plantuml set fmr=class*{,} fdm=marker fdc=1
    autocmd FileType xml vmap <C-b> :%!xmllint --encode UTF-8 --format -<CR>
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-node
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-jsdoc
    autocmd BufNewFile,BufReadPost Jenkinsfile* set filetype=groovy
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
        au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
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

let b:vm_tab_complete = "omni"
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,F <C-x><C-F>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

" leaders
let mapleader = ","
let maplocalleader = ",,"

" split
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>eW :e<space> 
map <leader>eS :sp 
map <leader>eV :vsp 
map <leader>eT :tabe
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/<C-d>
nnoremap <leader>b :b <C-d>
nnoremap <leader>g :grep<space>
nnoremap <leader>i :ilist<space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<cr>
nnoremap <leader>q :b#<cr>
map <leader>l :ls<CR>
nmap <silent> <C-S-L> <Plug>(jsdoc)
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>s :write<CR>


"UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/vim-snippets/UltiSnips', $HOME.'.vim/bundle/vim-react-snippets/UltiSnips']
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"TMUX
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>let g:tmux_navigator_save_on_switch = 2



" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :Glog<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Gpush<CR>
nnoremap <space>gpl :Git! pull<CR>
let g:gitgutter_realtime=0

set backspace=indent,eol,start
set shell=/bin/bash

"ALE
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 1
let g:jsx_ext_required=0
let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'jsx': ['eslint'],
        \   'java': []
        \ }
let g:javascript_plugin_jsdoc = 1
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
        \   'javascript': ['eslint'],
        \   'jsx': ['eslint'],
        \   'java': []
        \ }

set statusline=%{mode()}\ %F\ %{fugitive#statusline()}\ %m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

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

function! MyTabFilename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != a:n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction

let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#show_number = 1

let g:lightline = {
    \   'active': {
    \       'left': [ [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
    \   },
    \   'tabline': {
    \       'left': [ [ 'buffers' ] ]
    \   },
    \   'component_expand': {
    \       'buffers': 'lightline#bufferline#buffers'
    \   },
    \   'component_type': {
    \       'buffers': 'tabsel'
    \   },
    \   'component_function': {
    \       'gitbranch': 'fugitive#head'
    \   },
    \   'tab': {
    \       'active': [ 'tabnum', 'filename', 'modified' ],
    \       'inactive': [ 'tabnum', 'filename', 'modified' ]
    \   }
    \ }

