let g:ale_linters_explicit = 1
let g:ale_virtualtext_cursor = 0

let g:ale_linters = {
\	'*': ['vim-lsp']
\}

let g:ale_fixers = {
\	'*': [
\		'remove_trailing_lines',
\		'trim_whitespace'
\	]
\}

function! s:on_ale_buffer_enabled() abort
	if !exists('b:ale_enabled')
		return
	endif

	let b:ale_fix_on_save = 1
	let b:ale_lint_delay = 100

	nmap <buffer> [g <Plug>(ale_previous)
	nmap <buffer> ]g <Plug>(ale_next)
	nmap <buffer> <Leader>d <Plug>(ale_detail)
	nmap <buffer> <Leader>f <Plug>(ale_fix)

	augroup lsp_format
		autocmd! * <buffer>
	augroup END
endfunction

augroup ale_install
	autocmd!
	autocmd User ale_buffer_enabled call s:on_ale_buffer_enabled()
augroup END

augroup ale
	autocmd!
	autocmd BufEnter * call s:on_ale_buffer_enabled()
augroup END
