local null = require("null-ls")

null.setup({
	sources = {
		null.builtins.diagnostics.eslint,
		null.builtins.diagnostics.mypy,
		null.builtins.diagnostics.pylint,
		null.builtins.diagnostics.statix,
		null.builtins.formatting.alejandra,
		null.builtins.formatting.black,
		null.builtins.formatting.prettier,
		null.builtins.formatting.stylua,
		null.builtins.formatting.trim_newlines,
		null.builtins.formatting.trim_whitespace,
	},
	on_attach = function(_, bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "LspOnAttach", data = { bufnr = bufnr } })
	end,
})
