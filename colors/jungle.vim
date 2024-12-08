" sam
"  (https://github.com/samelinux/vim-theme)
" thanks Gautam Iyer <gautam@math.uchicago.edu for the color conversion func

highlight clear

if exists("syntax_on")
	syntax reset
endif
let g:colors_name="jungle"

" functions 
" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
	" get the closest grey
	let l:gx = <SID>grey_number(a:r)
	let l:gy = <SID>grey_number(a:g)
	let l:gz = <SID>grey_number(a:b)

	" get the closest color
	let l:x = <SID>rgb_number(a:r)
	let l:y = <SID>rgb_number(a:g)
	let l:z = <SID>rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = <SID>grey_level(l:gx) - a:r
		let l:dgg = <SID>grey_level(l:gy) - a:g
		let l:dgb = <SID>grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = <SID>rgb_level(l:gx) - a:r
		let l:dg = <SID>rgb_level(l:gy) - a:g
		let l:db = <SID>rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return <SID>grey_color(l:gx)
		else
			" use the color
			return <SID>rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return <SID>rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 1, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 3, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 5, 2)) + 0
	return <SID>color(l:r, l:g, l:b)
endfun

let s:palette={}

let s:palette.background=[0,'#121212']
let s:palette.foreground=[1,'#8FB88D']
let s:palette.highlight=[ 2,'#688B6E']
let s:palette.accent1=[   3,'#CD8D7A']
let s:palette.accent2=[   4,'#486B4E']
let s:palette.text01=[    5,'#484848']
let s:palette.text02=[    6,'#585858']
let s:palette.text03=[    7,'#686868']
let s:palette.text04=[    8,'#787878']
let s:palette.text05=[   10,'#989898']
let s:palette.text06=[   11,'#a8a8a8']
let s:palette.text07=[   13,'#e3e3e3']
let s:palette.green=[     9,'#87d7af']
let s:palette.red=[      14,'#dfafaf']
let s:palette.blue=[     12,'#afd7ff']

let g:terminal_ansi_colors=[
			\ s:palette.background[1],
			\ s:palette.foreground[1],
			\ s:palette.highlight[1],
			\ s:palette.accent1[1],
			\ s:palette.accent2[1],
			\ s:palette.text01[1],
			\ s:palette.text02[1],
			\ s:palette.text03[1],
			\ s:palette.text04[1],
			\ s:palette.green[1],
			\ s:palette.text05[1],
			\ s:palette.text06[1],
			\ s:palette.blue[1],
			\ s:palette.text07[1],
			\ s:palette.red[1],
			\ ]

function! s:hi(group,fg_color,bg_color,style)
	let highlight_command=['hi',a:group]
	if !empty(a:fg_color)
		let [ctermfg,guifg]=a:fg_color
		call add(highlight_command,printf('ctermfg=%s guifg=%s',<SID>rgb(guifg),guifg))
	endif
	if !empty(a:bg_color)
		let [ctermbg,guibg]=a:bg_color
		call add(highlight_command,printf('ctermbg=%s guibg=%s',<SID>rgb(guibg),guibg))
	endif
	if !empty(a:style)
		call add(highlight_command,printf('cterm=%s gui=%s',a:style,a:style))
	endif
	execute join(highlight_command,' ')
endfunction


call s:hi('Normal',s:palette.foreground,s:palette.background,'')

call s:hi('Constant',s:palette.text07,[],'bold')
call s:hi('String',s:palette.text07,[],'')
call s:hi('Number',s:palette.text07,[],'')

call s:hi('Identifier',s:palette.text06,[],'none')
call s:hi('Function',s:palette.text06,[],'')

call s:hi('Statement',s:palette.accent1,[],'bold')
call s:hi('Operator',s:palette.text04,[],'none')
call s:hi('Keyword',s:palette.text04,[],'')

call s:hi('Type',s:palette.accent1,[],'bold')

call s:hi('Special',s:palette.text04,[],'')
call s:hi('SpecialComment',s:palette.accent2,[],'bold')

call s:hi('Title',s:palette.text05,[],'bold')
call s:hi('Todo',s:palette.accent1,s:palette.background,'')
call s:hi('Comment',s:palette.accent2,[],'')

call s:hi('LineNr',s:palette.text03,[],'none')
call s:hi('FoldColumn',s:palette.text05,[],'none')
call s:hi('CursorLine',s:palette.text07,s:palette.highlight,'none')
call s:hi('CursorLineNr',s:palette.highlight,s:palette.text01,'none')

call s:hi('Visual',s:palette.text07,s:palette.accent2,'')
call s:hi('Search',s:palette.text07,s:palette.highlight,'none')
call s:hi('IncSearch',s:palette.text07,s:palette.highlight,'bold')

call s:hi('SpellBad',s:palette.red,s:palette.background,'undercurl')
call s:hi('SpellCap',s:palette.red,s:palette.background,'undercurl')
call s:hi('SpellLocal',s:palette.red,s:palette.background,'undercurl')
call s:hi('SpellRare',s:palette.red,s:palette.background,'undercurl')

call s:hi('Error',s:palette.red,s:palette.background,'bold')
call s:hi('ErrorMsg',s:palette.red,s:palette.background,'')
call s:hi('WarningMsg',s:palette.red,s:palette.background,'')
call s:hi('ModeMsg',s:palette.text07,[],'')
call s:hi('MoreMsg',s:palette.text07,[],'')

call s:hi('MatchParen',s:palette.red,s:palette.background,'')

call s:hi('Cursor',[],s:palette.text07,'')
call s:hi('SpecialKey',s:palette.text02,[],'')
call s:hi('NonText',s:palette.text02,[],'')
call s:hi('Directory',s:palette.text04,[],'')
call s:hi('PreProc',s:palette.text03,[],'none')

call s:hi('Pmenu',s:palette.text07,s:palette.text01,'none')
call s:hi('PmenuSbar',s:palette.background,s:palette.text07,'none')
call s:hi('PmenuSel',s:palette.text07,s:palette.accent2,'')
call s:hi('PmenuThumb',s:palette.text01,s:palette.text07,'none')

call s:hi('StatusLine',s:palette.text07,s:palette.accent2,'none')
call s:hi('StatusLineNC',s:palette.text03,s:palette.text01,'none')
call s:hi('WildMenu',s:palette.text06,[],'')
call s:hi('VertSplit',s:palette.text01,s:palette.text01,'none')

call s:hi('DiffAdd',s:palette.text01,s:palette.green,'')
call s:hi('DiffChange',s:palette.text01,s:palette.blue,'')
call s:hi('DiffDelete',s:palette.text01,s:palette.red,'')
call s:hi('DiffText',s:palette.background,s:palette.blue,'')
call s:hi('DiffAdded',s:palette.green,s:palette.background,'')
call s:hi('DiffChanged',s:palette.blue,s:palette.background,'')
call s:hi('DiffRemoved',s:palette.red,s:palette.background,'')

highlight! link Character Constant
highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn FoldColumn
highlight! link ColorColumn FoldColumn
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Exception Statement

highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc

highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type

highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Special
highlight! link Debug Special
highlight! link Question Special
highlight! link FloatBorder Special

highlight! link VisualNOS Visual
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine
