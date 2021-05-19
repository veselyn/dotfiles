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

    local opts = {noremap = true, silent = true}

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>k',
                   '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<leader>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ds',
                   '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap('n', '<leader>ws',
                   '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    buf_set_keymap('n', '<leader>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>rf',
                   '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command(
            'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            hi link LspReferenceRead Visual
            hi link LspReferenceText Visual
            hi link LspReferenceWrite Visual
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {signs = true, virtual_text = false})
}

local linters = require('efm/linters')
local formatters = require('efm/formatters')

local configs = {
    efm = {
        filetypes = {
            'lua', 'sh', 'javascript', 'javascriptreact', 'typescript',
            'typescriptreact', 'json', 'css', 'sass', 'scss', 'html', 'markdown'
        },
        init_options = {documentFormatting = true},
        settings = {
            languages = {
                lua = {formatters.luaFormat},
                sh = {linters.shellcheck, formatters.shfmt},
                javascript = {linters.eslint_d, formatters.prettier},
                javascriptreact = {linters.eslint_d, formatters.prettier},
                typescript = {linters.eslint_d, formatters.prettier},
                typescriptreact = {linters.eslint_d, formatters.prettier},
                json = {formatters.prettier},
                css = {formatters.prettier},
                sass = {formatters.prettier},
                scss = {formatters.prettier},
                html = {formatters.prettier},
                markdown = {linters.markdownlint}
            }
        },
        handlers = handlers,
        capabilities = capabilities,
        on_attach = on_attach
    },
    lua = {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';')
                },
                diagnostics = {globals = {'vim'}},
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                    }
                }
            }
        },
        handlers = handlers,
        capabilities = capabilities,
        on_attach = on_attach
    },
    typescript = {
        handlers = handlers,
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            on_attach(client, bufnr)
        end
    }
}

local servers = lspinstall.installed_servers()

for _, server in ipairs(servers) do
    local config = configs[server]

    if not config then config = {} end

    if not config.handlers then config.handlers = handlers end
    if not config.capabilities then config.capabilities = capabilities end
    if not config.on_attach then config.on_attach = on_attach end

    lspconfig[server].setup(config)
end
