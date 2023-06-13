local configs = require("nvim-treesitter.configs")

configs.setup({
	autotag = { enable = true },
	endwise = { enable = true },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
