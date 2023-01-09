" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2001 Jul 23
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "torte"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight CursorLine               guibg=Grey25
highlight CursorColumn             guibg=Grey25
highlight Normal     guifg=Grey80  guibg=Black
highlight Search     guifg=White   guibg=Grey40 gui=bold
highlight Visual     guifg=Grey25  guibg=Yellow gui=bold
highlight Cursor     guifg=Black   guibg=Green  gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue    guibg=white
highlight Statement  guifg=Yellow  gui=NONE
highlight Type       gui=NONE
highlight Folded     guifg=#80a0ff      guibg=black
highlight FoldColumn guifg=#80a0ff      guibg=black

" Console
highlight CursorLine               ctermbg=DarkBlue
highlight CursorColumn             ctermbg=DarkBlue
highlight Normal     ctermfg=LightGrey ctermbg=Black
highlight Search     ctermfg=Black     ctermbg=Red   cterm=NONE
highlight Visual     ctermfg=Black     ctermbg=Yellow
highlight Cursor     ctermfg=Black     ctermbg=Green cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Cyan
highlight StatusLine ctermfg=blue      ctermbg=white
highlight Statement  ctermfg=Yellow    cterm=NONE
highlight Type       cterm=NONE
highlight Folded     ctermfg=cyan      ctermbg=black
highlight FoldColumn ctermfg=cyan      ctermbg=black

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey      ctermbg=Black  cterm=NONE      guifg=Grey80 guibg=Black gui=NONE
    highlight Search  ctermfg=Black     ctermbg=Red    cterm=bold      guifg=Black  guibg=Red   gui=bold
    highlight Visual  ctermfg=Black     ctermbg=yellow cterm=bold      guifg=Grey25 gui=bold
    highlight Special ctermfg=LightBlue cterm=NONE     guifg=LightBlue gui=NONE
    highlight Comment ctermfg=Cyan      cterm=NONE     guifg=LightBlue gui=NONE
  endif
endif

