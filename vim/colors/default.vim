runtime colors/dim.vim

let colors_name = "default"

function! s:default() abort
	if &background == "light"
		highlight Comment ctermfg=8
	else
		highlight Comment ctermfg=7
	endif
	highlight clear SignColumn
	highlight link lspReference CursorLine
endfunction

augroup default
	autocmd!
	autocmd ColorScheme default call s:default()
augroup END
