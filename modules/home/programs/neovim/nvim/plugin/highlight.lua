vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("aul.highlight", {}),
	callback = function()
		vim.hl.on_yank()
	end,
})
