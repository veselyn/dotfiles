local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
    ensure_installed = 'all',
    highlight = {enable = true},
    incremental_selection = {enable = true},
    indent = {enable = true}
})
