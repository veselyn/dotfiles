vim.diagnostic.config({
	signs = { priority = 100 },
	virtual_text = true,
})

vim.keymap.set("n", "gK", function()
	vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end)
