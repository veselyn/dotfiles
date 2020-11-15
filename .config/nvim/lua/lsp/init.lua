local lsp = require('lspconfig')

local on_attach = function(client)
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})

  vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.diagnostic.rename()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<leader>g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<leader>g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true, silent = true})

  vim.api.nvim_set_keymap('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
  vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)')

  vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('completion').on_attach(client)
end

lsp.diagnosticls.setup({
  filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'html', 'css', 'sass', 'scss', 'markdown'},
  init_options = {
    linters = {
      eslint = {
        command = 'eslint',
        rootPatterns = {'.git'},
        debounce = 100,
        args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
      markdownlint = {
        command = 'markdownlint',
        rootPatterns = {'.git'},
        isStderr = true,
        debounce = 100,
        args = {'--stdin'},
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'markdownlint',
        securities = {
          undefined = 'hint'
        },
        formatLines = 1,
        formatPattern = {
          '^.*:(\\d+)\\s+(.*)$',
          {
            line = 1,
            column = -1,
            message = 2
          }
        }
      }
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
      markdown = 'markdownlint'
    },
    formatters = {
      prettier = {
        command = 'prettier',
        args = {'--stdin-filepath', '%filename'}
      }
    },
    formatFiletypes = {
      javascript = 'prettier',
      javascriptreact = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      json = 'prettier',
      html = 'prettier',
      css = 'prettier',
      sass = 'prettier',
      scss = 'prettier',
      markdown = 'prettier'
    }
  },
  on_attach = on_attach
})

lsp.sumneko_lua.setup({
  on_attach = on_attach
})

lsp.vimls.setup({
  on_attach = on_attach
})

lsp.tsserver.setup({
  on_attach = on_attach
})

lsp.jsonls.setup({
  on_attach = on_attach
})

lsp.cssls.setup({
  on_attach = on_attach
})

lsp.html.setup({
  on_attach = on_attach
})

lsp.jdtls.setup({
  on_attach = on_attach
})

lsp.rust_analyzer.setup({
  on_attach = on_attach
})
