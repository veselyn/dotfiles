function! s:on_lsp_buffer_enabled() abort
  nmap <buffer> \gd <Plug>(lsp-definition)
  nmap <buffer> \gD <Plug>(lsp-declaration)
  nmap <buffer> \gs <Plug>(lsp-document-symbol-search)
  nmap <buffer> \gS <Plug>(lsp-workspace-symbol-search)
  nmap <buffer> \gr <Plug>(lsp-references)
  nmap <buffer> \gi <Plug>(lsp-implementation)
  nmap <buffer> \gt <Plug>(lsp-type-definition)
  nmap <buffer> \rn <Plug>(lsp-rename)
  nmap <buffer> \ca <Plug>(lsp-code-action)
  nmap <buffer> \cl <Plug>(lsp-code-lens)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> \d <Plug>(lsp-document-diagnostics)
  nmap <buffer> \k <Plug>(lsp-signature-help)
  nmap <buffer> K <Plug>(lsp-hover)
  nmap <buffer> \f <Plug>(lsp-document-format)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre <buffer> call execute('LspDocumentFormatSync')

  inoremap <buffer> <expr> <C-F> lsp#scroll(+5)
  inoremap <buffer> <expr> <C-D> lsp#scroll(-5)
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
