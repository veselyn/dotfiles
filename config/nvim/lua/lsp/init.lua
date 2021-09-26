local lspconfig = require('lspconfig')

local lspinstall = require('lspinstall')
lspinstall.setup()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', '\\gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '\\gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap(
    'n',
    '\\gs',
    '<Cmd>lua vim.lsp.buf.document_symbol()<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '\\gS',
    '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>',
    opts
  )
  buf_set_keymap('n', '\\gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '\\gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(
    'n',
    '\\gt',
    '<Cmd>lua vim.lsp.buf.type_definition()<CR>',
    opts
  )
  buf_set_keymap('n', '\\rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '\\ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '[g', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap(
    'n',
    '\\d',
    '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '\\D',
    '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
    opts
  )
  buf_set_keymap('n', '\\k', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '\\f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command(
      'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)'
    )
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local handlers = {
  ['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      signs = true,
      virtual_text = false,
    }
  ),
}

local linters = require('efm/linters')
local formatters = require('efm/formatters')

local configs = {
  efm = {
    init_options = { documentFormatting = true },
    filetypes = {
      'css',
      'html',
      'javascript',
      'javascriptreact',
      'json',
      'lua',
      'scss',
      'sh',
      'typescript',
      'typescriptreact',
    },
    settings = {
      languages = {
        css = { formatters.prettier },
        html = { formatters.prettier },
        javascript = { linters.eslint_d, formatters.prettier },
        javascriptreact = { linters.eslint_d, formatters.prettier },
        json = { formatters.prettier },
        lua = { formatters.luaFormat },
        scss = { formatters.prettier },
        sh = { linters.shellcheck, formatters.shfmt },
        typescript = { linters.eslint_d, formatters.prettier },
        typescriptreact = { linters.eslint_d, formatters.prettier },
      },
    },
  },
  lua = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  },
  typescript = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  },
}

local installed_servers = lspinstall.installed_servers()

local servers = {
  'bash',
  'cpp',
  'css',
  'efm',
  'go',
  'html',
  'java',
  'json',
  'lua',
  'python',
  'ruby',
  'rust',
  'typescript',
  'vim',
}

for _, server in ipairs(servers) do
  if not vim.tbl_contains(installed_servers, server) then
    lspinstall.install_server(server)
  end

  local config = configs[server]

  if not config then
    config = {}
  end

  if not config.handlers then
    config.handlers = handlers
  end
  if not config.capabilities then
    config.capabilities = capabilities
  end
  if not config.on_attach then
    config.on_attach = on_attach
  end

  lspconfig[server].setup(config)
end
