function! s:toggle_quickfix() abort
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
		return
	endif

	cclose
endfunction

function! s:toggle_loclist() abort
	if empty(filter(getwininfo(), 'v:val.loclist'))
		lopen
		return
	endif

	lclose
endfunction

nnoremap <silent> <Leader>q :call <SID>toggle_quickfix()<CR>
nnoremap <silent> <Leader>l :call <SID>toggle_loclist()<CR>
