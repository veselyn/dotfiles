vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("Highlight", {}),
	callback = function()
		vim.highlight.on_yank()
	end,
})
