local configs = require("nvim-treesitter.configs")

configs.setup({
	autotag = { enable = true },
	endwise = { enable = true },
	highlight = { enable = true, additional_vim_regex_highlighting = { "gitcommit" } },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
