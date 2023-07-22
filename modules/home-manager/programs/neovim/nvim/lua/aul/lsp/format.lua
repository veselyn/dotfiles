local augroup = vim.api.nvim_create_augroup("LspFormat", {})

local function format_on_save(bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})
end

return format_on_save
