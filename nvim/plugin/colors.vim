colorscheme nord
let g:nord_italic=1
let g:nord_bord=1
let g:nord_underline=1
let g:nord_italic_comments=1
let g:nord_cursor_line_number_background=0
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background=1

hi Normal ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight Search ctermbg=8 guibg=#4C566A ctermfg=7 guifg=#8FBCBB
  autocmd ColorScheme nord highlight link LspDiagnosticsVirtualTextError LspDiagnosticsError
  autocmd ColorScheme nord highlight link LspDiagnosticsVirtualTextWarning LspDiagnosticsWarning
  autocmd ColorScheme nord highlight link LspDiagnosticsVirtualTextInformation LspDiagnosticsInformation
  autocmd ColorScheme nord highlight link LspDiagnosticsVirtualTextHint LspDiagnosticsHint
  autocmd ColorScheme nord highlight link LspDiagnosticsSignError LspDiagnosticsError
  autocmd ColorScheme nord highlight link LspDiagnosticsSignWarning LspDiagnosticsWarning
  autocmd ColorScheme nord highlight link LspDiagnosticsSignInformation LspDiagnosticsInformation
  autocmd ColorScheme nord highlight link LspDiagnosticsSignHint LspDiagnosticsHint
augroup END

