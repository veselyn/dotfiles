local cmp = require('cmp')

local luasnip = require('luasnip')

local lspkind = require('lspkind')

local feedkey = function(key)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),
                          'n', true)
end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match('%s') == nil
end

cmp.setup({
    completion = {autocomplete = false},
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-5),
        ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                feedkey('<C-n>')
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                feedkey('<C-p>')
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' ..
                                vim_item.kind

            vim_item.menu = ({
                path = '[PATH]',
                buffer = '[BUFFER]',
                tags = '[TAGS]',
                spell = '[SPELL]',
                calc = '[CALC]',
                nvim_lsp = '[NVIM_LSP]',
                nvim_lua = '[NVIM_LUA]',
                luasnip = '[LUASNIP]',
                treesitter = '[TREESITTER]'
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        {name = 'path'}, {name = 'buffer'}, {name = 'tags'}, {name = 'spell'},
        {name = 'calc'}, {name = 'nvim_lsp'}, {name = 'nvim_lua'},
        {name = 'luasnip'}, {name = 'treesitter'}
    }
})
