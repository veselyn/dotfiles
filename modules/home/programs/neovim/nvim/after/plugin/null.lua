local null = require("null-ls")

local treefmt = null.builtins.formatting.treefmt.with({
	condition = function()
		return true
	end,
})

null.setup({
	sources = { treefmt },
	on_attach = function(_, bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "LspOnAttach", data = { bufnr = bufnr } })
	end,
})
