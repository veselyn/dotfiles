local augroup = vim.api.nvim_create_augroup("LspFormat", {})

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LspOnAttach" .. vim.fn.expand("<sfile>:t:r"), {}),
	pattern = "LspOnAttach",
	callback = function(args)
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = args.data.bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = args.data.bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
})
