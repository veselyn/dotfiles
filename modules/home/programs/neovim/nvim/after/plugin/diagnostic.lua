vim.diagnostic.config({
	signs = { priority = 100 },
	virtual_text = true,
})

vim.keymap.set("n", "gL", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

vim.keymap.set("n", "gl", function()
	local virtual_lines = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({
		virtual_text = not virtual_lines,
		virtual_lines = virtual_lines,
	})
end)

vim.keymap.set("n", "grl", vim.diagnostic.setloclist)
vim.keymap.set("n", "grq", vim.diagnostic.setqflist)
