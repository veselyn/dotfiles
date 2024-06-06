local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	endwise = { enable = true },
	highlight = { enable = true, additional_vim_regex_highlighting = { "gitcommit" } },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
