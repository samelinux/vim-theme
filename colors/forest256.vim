" Name: forest356
" Maintainer: Courtney Bodi <mliscourtney@gmail.com>
" Last Change: February 18, 2016
" Description: A 256 color colorscheme for vim

" Settings so vim will use colors that look good on a dark background
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "forest256"

" Preferred syntax groups (for details type :help group-name)
hi Comment              ctermfg=059     ctermbg=NONE    cterm=NONE
hi Constant             ctermfg=107     ctermbg=NONE    cterm=NONE
hi Identifier           ctermfg=145     ctermbg=NONE    cterm=NONE
hi Statement            ctermfg=231     ctermbg=NONE    cterm=bold
hi PreProc              ctermfg=222     ctermbg=NONE    cterm=NONE
hi Type                 ctermfg=095     ctermbg=NONE    cterm=NONE
hi Special              ctermfg=185     ctermbg=NONE    cterm=NONE
hi Underlined           ctermfg=145     ctermbg=NONE    cterm=underline
hi Ignore               ctermfg=185     ctermbg=NONE    cterm=bold
hi Error                ctermfg=124     ctermbg=NONE    cterm=bold
hi Todo                 ctermfg=231     ctermbg=NONE    cterm=bold

" Default highlight groups (for details type :help highlight-groups)
hi ColorColumn          ctermfg=NONE    ctermbg=234     cterm=NONE
hi! link Conceal        Normal

hi Cursor               ctermfg=NONE    ctermbg=247     cterm=NONE
hi! link CursorIM       Cursor
hi! link CursorColumn   Cursor
hi CursorLine           ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi CursorLineNr         ctermfg=235     ctermbg=059     cterm=bold

hi Directory            ctermfg=137     ctermbg=NONE    cterm=NONE

hi DiffAdd              ctermfg=235     ctermbg=185     cterm=NONE
hi DiffChange           ctermfg=235     ctermbg=231     cterm=NONE
hi DiffDelete           ctermfg=235     ctermbg=124     cterm=NONE
hi DiffText             ctermfg=235     ctermbg=222     cterm=NONE

hi! link ErrorMsg       Error

hi VertSplit            ctermfg=235     ctermbg=235     cterm=NONE

hi! link Folded         Ignore
hi! link FoldColumn     Ignore

hi! link SignColumn     Ignore
hi IncSearch            ctermfg=235     ctermbg=222     cterm=NONE
hi! link LineNr         Comment
hi MatchParen           ctermfg=185     ctermbg=NONE    cterm=bold,underline

"hi ModeMsg
hi! link MoreMsg        Normal

hi! link NonText        Special
hi Normal               ctermfg=145     ctermbg=235

hi! link Pmenu          DiffAdd
hi PmenuSel             ctermfg=NONE    ctermbg=059     cterm=NONE
hi PmenuSbar            ctermfg=NONE    ctermbg=247     cterm=NONE
"hi PmenuThumb

hi! link Question       Normal
hi Search               ctermfg=235     ctermbg=185     cterm=NONE
hi! link SpecialKey     Special

hi! link SpellBad       DiffDelete
hi! link SpellCap       DiffChange
hi! link SpellLocal     DiffAdd
hi! link SpellRare      DiffText

hi StatusLine           ctermfg=235     ctermbg=059     cterm=bold
hi StatusLineNC         ctermfg=145     ctermbg=234     cterm=NONE

hi TabLine              ctermfg=NONE    ctermbg=059     cterm=NONE
hi TabLineFill          ctermfg=NONE    ctermbg=NONE    cterm=reverse
hi TabLineSel           ctermfg=NONE    ctermbg=NONE    cterm=bold

hi Title                ctermfg=NONE    ctermbg=NONE    cterm=bold
hi! link Visual         Cursor
hi! link VisualNOS      Cursor
hi! link WarningMsg     Error
hi WildMenu             ctermfg=235     ctermbg=185     cterm=bold

