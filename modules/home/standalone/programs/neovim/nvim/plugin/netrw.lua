vim.keymap.set("n", "<Leader>ns", function()
	vim.cmd.Sexplore()
end)

vim.keymap.set("n", "<Leader>nt", function()
	vim.cmd.Texplore()
end)

vim.keymap.set("n", "<Leader>nv", function()
	vim.cmd.Sexplore({ bang = true })
end)
