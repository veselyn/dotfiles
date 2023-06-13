local configs = require("nvim-treesitter.configs")

configs.setup({
	endwise = { enable = true },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
