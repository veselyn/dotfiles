function! s:on_lsp_buffer_enabled() abort
  nmap <buffer> gd <Plug>(lsp-definition)
  nmap <buffer> gD <Plug>(lsp-declaration)
  nmap <buffer> gs <Plug>(lsp-document-symbol-search)
  nmap <buffer> gS <Plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <Plug>(lsp-references)
  nmap <buffer> gi <Plug>(lsp-implementation)
  nmap <buffer> gt <Plug>(lsp-type-definition)
  nmap <buffer> \rn <Plug>(lsp-rename)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <Plug>(lsp-hover)
  inoremap <buffer> <expr> <C-F> lsp#scroll(+5)
  inoremap <buffer> <expr> <C-D> lsp#scroll(-5)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre <buffer> call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
