filetype plugin indent on
syntax on
set number
set clipboard=unnamed
set relativenumber
set showtabline=2
set noshowmode
set t_Co=256
set foldcolumn=2
set foldlevelstart=1
set foldmethod=indent
set wildmode=longest,list,full
set wildmenu
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set exrc
set laststatus=2
imap jj <ESC>
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
set undofile
set undodir=~/.vim/undodir
set colorcolumn=100,180
set backspace=indent,eol,start
set shell=/bin/bash
set termguicolors

set directory^=~/.vim/cache/swap//
if has('win32') || has('win64')
  set directory-=~/.vim/cache/swap//
  set directory^=~/vimfiles/cache/swap//
endif

" Try to keep backups in one system-appropriate dir
set nobackup
set nowritebackup


" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

set scrolloff=8

set tags='.git/tags'

let g:completion_enable_auto_popup = 0
