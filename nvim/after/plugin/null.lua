local null = require("null-ls")

null.setup({
	sources = {
		null.builtins.formatting.stylua,
	},
	on_attach = function(_, bufnr)
		local augroup = vim.api.nvim_create_augroup("LspFormat", { clear = false })
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
})
