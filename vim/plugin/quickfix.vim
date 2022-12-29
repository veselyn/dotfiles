function! s:toggle_quickfix() abort
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfunction

function! s:toggle_loclist() abort
	if empty(filter(getwininfo(), 'v:val.loclist'))
		lopen
	else
		lclose
	endif
endfunction

nnoremap <silent> <Leader>q :call <SID>toggle_quickfix()<CR>
nnoremap <silent> <Leader>l :call <SID>toggle_loclist()<CR>
