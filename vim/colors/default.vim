runtime colors/dim.vim

let colors_name = "default"

function! s:default() abort
	if &background == "light"
	else
	endif
	highlight clear SignColumn
	highlight link lspReference CursorLine
endfunction

augroup default
	autocmd!
	autocmd ColorScheme default call s:default()
augroup END
