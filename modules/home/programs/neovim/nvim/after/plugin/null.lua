local null = require("null-ls")

null.setup({
	sources = {
		null.builtins.formatting.treefmt,
	},
	on_attach = function(_, bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "LspOnAttach", data = { bufnr = bufnr } })
	end,
})
