local null = require("null-ls")
local format_on_save = require("aul.lsp.format")

null.setup({
	sources = {
		null.builtins.diagnostics.statix,
		null.builtins.formatting.alejandra,
		null.builtins.formatting.stylua,
	},
	on_attach = function(_, bufnr)
		format_on_save(bufnr)
	end,
})
