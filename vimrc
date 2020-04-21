set runtimepath+=~/.vim/bundle/ultisnips/

call plug#begin('~/.vim/bundle')
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'ekalinin/dockerfile.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'aklt/plantuml-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'rhysd/vim-grammarous'
Plug 'leafgarland/typescript-vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

filetype plugin indent on
syntax on
set number
set clipboard=unnamedplus
set relativenumber
set showtabline=2
set noshowmode

set omnifunc=syntaxcomplete#Complete

"TMUX
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>let g:tmux_navigator_save_on_switch = 2
nnoremap <slient> <C-S> :update<CR>
vnoremap <slient> <C-S> <C-C>:update<CR>
inoremap <slient> <C-S> <C-O>:update<CR>
set t_Co=256

inoremap <silent> ,F <c-x><C-F>
inoremap <silent> ,i <c-x><C-i>
inoremap <silent> ,n <c-x><C-n>
inoremap <silent> ,o <c-x><C-o>
inoremap <silent> ,t <c-x><C-]>
let g:nord_italic=1
let g:nord_italic_comments=1
colorscheme nord
set foldcolumn=2
set foldlevelstart=1
set foldmethod=indent
set wildmode=longest,list,full
set wildmenu
set t_Co=256
hi Normal ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
inoremap <silent> ,f <C-x><C-f>
imap jj <ESC>
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set exrc
set laststatus=2
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
set undofile
set undodir=~/.undodir

set colorcolumn=100,180

" netrw
let g:netrw_banner = 0

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
map <leader>fs :sf<space>%%
map <leader>fw :find<space>%%
map <leader>fv :vert sf<space>%%
map <leader>fS :sf<space>
map <leader>fW :find<space>
map <leader>fV :vert sf<space>
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/<C-d>
nnoremap <leader>gp :grep<space>
nnoremap <leader>i :ilist<space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<cr>
nnoremap <leader>q :b#<cr>
map <leader>l :ls<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>s :write<CR>

"UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/**/UltiSnips']
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

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
let g:ale_completion_enabled = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:jsx_ext_required=0
let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'jsx': ['eslint'],
        \   'typescript': ['tslint'],
        \   'java': []
        \ }
let g:javascript_plugin_jsdoc = 0
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
        \   'javascript': ['eslint'],
        \   'java': [],
        \   'typescript': ['tslint']
        \ }

set statusline=%{mode()}\ %F\ %{fugitive#statusline()}\ %m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

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

let g:lightline = {}

let g:lightline.colorscheme = 'nord'

let g:lightline.component_function = {
            \   'fugitive': 'LightlineFugitive',
            \   'readonly': 'LightlineReadonly'
            \}

let g:lightline.component_visible_condition = {
            \   'readonly': '(&filetype!="help"&& &readonly)'
            \}

let g:lightline.component_expand = {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \ }


let g:lightline.component_type = {
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left',
    \}

let g:lightline.active = { 
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
    \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], [ 'fugitive' ]]
    \}

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nnoremap <leader>t :BTags<cr>
nnoremap <localleader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :BCommits<cr>
nnoremap <localleader>c :Commits<cr>
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :GFiles?<cr>
nnoremap <localleader>f :Files<cr>
nnoremap <leader>h :Helptags<cr>
nnoremap <leader>g :GGrep<cr>

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

set tags='.git/tags'

" Try to keep backups in one system-appropriate dir
set backup
set backupdir^=~/.vim/cache/backup
if has('win32') || has('win64')
  set backupdir-=~/.vim/cache/backup
  set backupdir^=~/vimfiles/cache/backup
endif" swp

" Try to keep swapfiles in one system-appropriate dir
set directory^=~/.vim/cache/swap//
if has('win32') || has('win64')
  set directory-=~/.vim/cache/swap//
  set directory^=~/vimfiles/cache/swap//
endif

" Keep undo files, hopefully in a dedicated directory
if has('persistent_undo')
  set undofile
  set undodir^=~/.vim/cache/undo//
  if has('win32') || has('win64')
    set undodir-=~/.vim/cache/undo//
    set undodir^=~/vimfiles/cache/undo//
  endif
endif

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

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

map <C-n> :NERDTreeToggle<CR>
