set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.vim/bundle/ultisnips/

call plug#begin('~/.vim/bundle')
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'ekalinin/dockerfile.vim'
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
Plug 'leafgarland/typescript-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'udalov/kotlin-vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-sleuth'
Plug 'arcticicestudio/nord-vim'
call plug#end()

let mapleader = ","
let maplocalleader = ",,"

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

let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#show_number = 1

let g:lightline = {}

let g:lightline.colorscheme = 'nord'

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline.component_function = {
            \   'gitbranch': 'FugitiveHead',
            \   'readonly': 'LightlineReadonly',
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'CocCurrentFunction'
            \}

let g:lightline.component_visible_condition = {
            \   'readonly': '(&filetype!="help"&& &readonly)'
            \}


let g:lightline.active = { 
    \   'left': [ [ 'mode', 'paste' ], [ 'cocstatus', 'currentfunction', 'readonly', 'relativepath', 'modified' ] ],
    \   'right': [ ['gitbranch', 'percent', 'lineinfo' ] ]
    \}

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
