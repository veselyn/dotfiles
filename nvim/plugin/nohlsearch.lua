vim.keymap.set("n", "<Esc>", function()
	vim.cmd.nohlsearch()
	pcall(vim.cmd.diffupdate)
end)
