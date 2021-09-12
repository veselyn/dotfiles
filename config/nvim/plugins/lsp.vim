lua require('lsp')

function ForceReload()
  lua vim.lsp.stop_client(vim.lsp.get_active_clients())
  sleep
  edit
endfunction

command ForceReload call ForceReload()
