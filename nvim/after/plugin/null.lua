local null = require("null-ls")

null.setup({
	sources = {
		null.builtins.formatting.stylua,
	},
})
