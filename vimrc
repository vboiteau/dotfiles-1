set runtimepath+=~/.vim/bundle/ultisnips/

call plug#begin('~/.vim/bundle')
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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
call plug#end()

filetype plugin indent on
syntax on
set number
set clipboard=unnamed
set relativenumber
set showtabline=2
set noshowmode

set omnifunc=syntaxcomplete#Complete

set t_Co=256

"TMUX
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>let g:tmux_navigator_save_on_switch = 2

" Colorscheme
let g:nord_italic=1
let g:nord_italic_comments=1
let g:nord_cursor_line_number_background=0
colorscheme nord
hi Normal ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE

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
nnoremap <leader>gp :grep<space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<cr>
nnoremap <leader>q :b#<cr>
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
nnoremap <space>gl :Glog<CR>
nnoremap <space>gp :Ggrep<Space>

let g:gitgutter_realtime=0

set backspace=indent,eol,start
set shell=/bin/bash

"ALE
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

nnoremap <localleader>b :Buffers<cr>
nnoremap <localleader>c :Commits<cr>
nnoremap <localleader>f :GFiles<cr>
nnoremap <localleader>F :GFiles?<cr>
nnoremap <localleader>h :Helptags<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

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
set nobackup
set nowritebackup

" Try to keep swapfiles in one system-appropriate dir
set directory^=~/.vim/cache/swap//
if has('win32') || has('win64')
  set directory-=~/.vim/cache/swap//
  set directory^=~/vimfiles/cache/swap//
endif

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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd BufNewFile typescript,json,javascript :CocRestart<CR>
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>

vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc.nvim
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:coc_disable_transparent_cursor=1
