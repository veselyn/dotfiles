runtime colors/dim.vim

function! s:dim() abort
	if &background == "light"
		highlight Comment ctermfg=8
	else
		highlight Comment ctermfg=7
	endif
	highlight clear SignColumn
endfunction

augroup dim
	autocmd!
	autocmd ColorScheme dim call s:dim()
augroup END
