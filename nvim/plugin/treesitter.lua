local configs = require('nvim-treesitter.configs')

configs.setup({
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
