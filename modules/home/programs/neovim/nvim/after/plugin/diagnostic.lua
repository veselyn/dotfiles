vim.diagnostic.config({
	signs = { priority = 100 },
	virtual_text = true,
})

vim.keymap.set("n", "gl", function()
	vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end)

vim.keymap.set("n", "gL", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
