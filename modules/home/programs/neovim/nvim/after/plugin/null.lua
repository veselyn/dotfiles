local null = require("null-ls")
local format_on_save = require("aul.lsp.format")

null.setup({
	sources = {
		null.builtins.diagnostics.mypy,
		null.builtins.diagnostics.pylint,
		null.builtins.diagnostics.statix,
		null.builtins.formatting.alejandra,
		null.builtins.formatting.black,
		null.builtins.formatting.stylua,
		null.builtins.formatting.trim_newlines,
		null.builtins.formatting.trim_whitespace,
	},
	on_attach = function(_, bufnr)
		format_on_save(bufnr)
	end,
})
