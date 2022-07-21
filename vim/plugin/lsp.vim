function! s:on_lsp_buffer_enabled() abort
	nmap <buffer> <Leader>gd <Plug>(lsp-definition)
	nmap <buffer> <Leader>gD <Plug>(lsp-declaration)
	nmap <buffer> <Leader>gs <Plug>(lsp-document-symbol-search)
	nmap <buffer> <Leader>gS <Plug>(lsp-workspace-symbol-search)
	nmap <buffer> <Leader>gr <Plug>(lsp-references)
	nmap <buffer> <Leader>gi <Plug>(lsp-implementation)
	nmap <buffer> <Leader>gt <Plug>(lsp-type-definition)
	nmap <buffer> <Leader>rn <Plug>(lsp-rename)
	nmap <buffer> <Leader>ca <Plug>(lsp-code-action)
	nmap <buffer> <Leader>cl <Plug>(lsp-code-lens)
	nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
	nmap <buffer> <Leader>D <Plug>(lsp-document-diagnostics)
	nmap <buffer> <Leader>k <Plug>(lsp-signature-help)
	nmap <buffer> K <Plug>(lsp-hover)
	nmap <buffer> <Leader>f <Plug>(lsp-document-format)
	imap <buffer> <expr> <Up> lsp#scroll(-1)
	nmap <buffer> <expr> <Up> lsp#scroll(-1)
	imap <buffer> <expr> <Down> lsp#scroll(+1)
	nmap <buffer> <expr> <Down> lsp#scroll(+1)

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre <buffer> call execute('LspDocumentFormatSync')

	doautocmd <nomodeline> User ale_buffer_enabled
endfunction

augroup lsp_install
	autocmd!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
