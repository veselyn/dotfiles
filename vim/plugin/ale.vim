let g:ale_linters_explicit = 1

let g:ale_linters = {
\  '*': ['vim-lsp']
\}

function! s:on_ale_buffer_enabled() abort
  if !exists('b:ale_enabled')
    return
  endif

  let b:ale_fix_on_save = 1

  nmap <buffer> [g <Plug>(ale_previous)
  nmap <buffer> ]g <Plug>(ale_next)
  nmap <buffer> <Leader>d <Plug>(ale_detail)
  nmap <buffer> <Leader>f <Plug>(ale_fix)

  autocmd! BufWritePre <buffer>
endfunction

augroup ale_install
  autocmd!
  autocmd User ale_buffer_enabled call s:on_ale_buffer_enabled()
augroup END
